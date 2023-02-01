//
//  Post.swift
//  Navigation
//
//  Created by Владимир Винокуров on 24.11.2022.
//

import Foundation
struct Post {
    var title: String
}

struct Posts {
    var author: String
    var description: String
    var image: String
    var likes: Int
    var views: Int
}

var profilePosts = [
    Posts(author: "Интерфакс", description: "Цены на нефть растут после падения по итогам минувшей недели. Главным негативным фактором для нефтяных котировок на прошлой неделе стали опасения по поводу рецессии в мировой экономике и спроса на топливо в Китае. Трейдеры боятся, что на фоне данных о сохранении высокого уровня деловой активности в США и достаточно высокой инфляции Федрезерв продолжит придерживаться жесткой денежно-кредитной политики и не станет торопиться со снижением ставок. Это может замедлить экономический рост в Соединенных Штатах и в мире в целом или даже привести к глобальной рецессии, что понизит спрос на топливо.", image: "нефть.jpeg", likes: 200, views: 2350),
    Posts(author: "Minimalism", description: "В чем смысл минимализма? Почему нас вообще должно волновать меньшее потребление и нужно ли нам отказываться от всего, что есть?", image: "минимализм.jpeg", likes: 45, views: 573),
    Posts(author: "mini.people", description: "Прокачай свой MINI наклейками", image: "mini.jpeg", likes: 347, views: 1250),
    Posts(author: "kot.tattoo", description: "Свободный эскиз от мастера Саши", image: "кот.jpeg", likes: 206, views: 3458)]

