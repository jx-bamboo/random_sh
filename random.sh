echo "********** ❤️  欢迎使用渡边密码生成器❤️  **********"
echo ""
get_num(){
  printf "********** 请输入您要生成密码的位数（仅限数字）："
  while read FILM
  do
    if [ $FILM -lt 6 ]
    then
      printf "********** 密码必须大于等于 ⭕️ 6 ⭕️ 位，请重新输入："
    else
      break
    fi
  done
  return $FILM
}

get_ge6(){
  echo "********** 您将产生 ⭕️ $n ⭕️ 位数的密码 **********"
  #arr=(1 a A 2 b B 3 c C 4 d D 5 e E 6 f F 7 G h 8 H i 9 I j J L m M n N p P q Q r R s S t T u U v V w W x X y Y z Z )
  #select_arr=$(($RANDOM%3))
  a1=(2 3 4 5 6 7 8)
  a2=(a b c d e f h i j k m n p q r s t u v w x y z)
  a3=(A B C D E F G H I J K L M N P Q R S T U V W X Y Z)
  $(> temp)
  count=1
  while [ $count -le $n ]
  do
    select_arr=$(($RANDOM%3))
    case $select_arr in
        0) printf ${a1[$(($RANDOM%${#a1[*]}))]} >> temp
        ;;
        1) printf ${a2[$(($RANDOM%${#a2[*]}))]} >> temp
        ;;
        2) printf ${a3[$(($RANDOM%${#a3[*]}))]} >> temp
        ;;
    esac
    #printf ${arr[$(($RANDOM%${#arr[*]}))]} >> temp
    count=`expr $count + 1`
  done
  echo "********** 您的一次性密码是： $(cat temp) **********"
  rm temp
}

if [ $1 ]
then
  if [ $1 -ge 6 ]
  then
    n=$1
    get_ge6
  else
    echo "********** 您携带的密码位数太低，必须大于等于6位 **********"
    get_num
    n=$?
    get_ge6
  fi
else
  echo "********** 密码生成器已经启动，但是您没有没有输入任何参数  **********"
  printf "********** ";sleep 0.1;printf "关";sleep 0.1;printf "闭";sleep 0.1;printf "程"
sleep 0.1;printf "序";sleep 0.1;printf "请";sleep 0.1;printf "按";sleep 0.1;printf "Ctrl+c";sleep 0.1;printf " **********\n"
  get_num
  n=$?
  get_ge6
fi
echo "********** 10秒后程序将自动关闭，请及时复制您的密码  **********"
sleep 10
