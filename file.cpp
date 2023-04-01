#include "file.h"
#include <QFile>
#include <QTime>

File::File(QObject *parent)
    : QObject{parent}
{
    connect(this,SIGNAL(sourceChanged()),this,SLOT(readFile()));
    //connect(timer,SIGNAL(timeout()),this,SLOT(rand()));
}

QString File::source() const
{
    return m_source;
}

void File::setSource(const QString &source)
{
    m_source = source;
    emit sourceChanged();
}

QString File::text() const
{
    return m_text;
}

void File::setText(const QString &text)
{
   QFile file(m_source);
   if(!file.open(QIODevice::WriteOnly))
   {
       m_text = "";
   }
   else
   {
       qint64 byte = file.write(text.toUtf8());
       if(byte!=text.toUtf8().size())
       {
            m_text = text.toUtf8().left(byte);
       }
       else
       {
            m_text = text;
       }
       file.close();
   }
   emit textChanged();
}

void File::readFile()
{
    QFile file(m_source);
    if(!file.open(QIODevice::ReadOnly | QIODevice::Text))
    {
        m_text="";
    }
    m_text = file.readAll();
    file.close();

    students = m_text.split("\n");
    //emit textChanged();
}
