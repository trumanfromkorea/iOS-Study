# Hashable

> A type that can be hashed into a Hasher to produce an integer hash value.
>
> 정수로 이루어진 Hash 값을 생성할 수 있는 타입입니다.

Swift 에서 Dictionary 는 `Dictionary<KeyType, ValueType>` 형태로 쓰이는데,

Key Type 은 무조건 Hash 가능한 타입이어야 한다.

Python 에서도 Dictionary 는 Hash Table 로 이용되고 Javascript 의 HashMap 도 마찬가지인데, 이러한 부분들을 떠올리며 생각하면 이해에 도움이 될 수 있을 것 같다.

여기서 Key Type 이 Hash 로 이용되는 이유를 생각해보자면, 유일하게 표현 가능한 방법을 제공해야 하기 때문일 것이다.

서로 다른 데이터를 Hashing 하였을때 같은 Hash 는 절대 존재할 수 없기 때문에 Dictionary 의 Key 를 유일하게 표현할 수 있는 것이다.

