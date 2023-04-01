#ifndef FILE_H
#define FILE_H

#include <QObject>
#include <QList>
#include <QTimer>

class File : public QObject
{
    Q_OBJECT
public:
    //explicit：指定构造函数或转换函数为显式，作用就是防止类构造函数的隐式自动转换
    //explicit只能修饰含有一个参数的构造函数，或除第一个参数外其余参数都有默认值的构造函数
    explicit File(QObject *parent = nullptr);
    //作为组件，暴露属性给qml
    Q_PROPERTY(QString source READ source WRITE setSource NOTIFY sourceChanged)
    Q_PROPERTY(QString text READ text WRITE setText NOTIFY textChanged)

    //const:常成员函数，可读取成员变量的值，但不能修改
    QString source() const;
    void setSource(const QString &source);

    QString text() const;
    void setText(const QString &text);

    QStringList students;


signals:
    void sourceChanged();
    void textChanged();

private slots:
    void readFile();


private:
    QString m_source;
    QString m_text;
    QTimer *timer = new QTimer;
};

#endif // FILE_H
