# ✨READY

## Домашнее задание к занятию «2.4. Инструменты Git»

### Цель задания

В результате выполнения этого задания вы научитесь работать с утилитами Git и  потренируетесь решать типовые задачи, возникающие при работе в команде. 

### Инструкция к заданию

1. Склонируйте [репозиторий](https://github.com/hashicorp/terraform) с исходным кодом Terraform.
2. Создайте файл для ответов на задания в своём репозитории, после выполнения, прикрепите ссылку на .md-файл с ответами в личном кабинете.
3. Любые вопросы по решению задач задавайте в чате учебной группы.

------

## Задание

В клонированном репозитории:

1. Найдите полный хеш и комментарий коммита, хеш которого начинается на `aefea`.

✨
```
mikhailk@Jinhae-PC:~/devops-netology/sysadm-homeworks/02-git-04-tools/terraform$ git log aefea --stat
commit aefead2207ef7e2aa5dc81a34aedf0cad4c32545
Author: Alisdair McDiarmid <alisdair@users.noreply.github.com>
Date:   Thu Jun 18 10:29:58 2020 -0400

    Update CHANGELOG.md

 CHANGELOG.md | 1 +
 1 file changed, 1 insertion(+)
```

2. Какому тегу соответствует коммит `85024d3`?

✨
```
mikhailk@Jinhae-PC:~/devops-netology/sysadm-homeworks/02-git-04-tools/terraform$ git log 85024d3 --stat
commit 85024d3100126de36331c6982bfaac02cdab9e76 (tag: v0.12.23)
Author: tf-release-bot <terraform@hashicorp.com>
Date:   Thu Mar 5 20:56:10 2020 +0000

    v0.12.23

 CHANGELOG.md       | 2 +-
 version/version.go | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
```

3. Сколько родителей у коммита `b8d720`? Напишите их хеши.

✨
```
mikhailk@Jinhae-PC:~/devops-netology/sysadm-homeworks/02-git-04-tools/terraform$ git show b8d720 --stat
commit b8d720f8340221f2146e4e4870bf2ee0bc48f2d5
Merge: 56cd7859e0 9ea88f22fc
```

4. Перечислите хеши и комментарии всех коммитов которые были сделаны между тегами  v0.12.23 и v0.12.24.

✨
```
mikhailk@Jinhae-PC:~/devops-netology/sysadm-homeworks/02-git-04-tools/terraform$ git log --oneline v0.12.24
33ff1c03bb (tag: v0.12.24) v0.12.24
b14b74c493 [Website] vmc provider links
3f235065b9 Update CHANGELOG.md
6ae64e247b registry: Fix panic when server is unreachable
5c619ca1ba website: Remove links to the getting started guide's old location
06275647e2 Update CHANGELOG.md
d5f9411f51 command: Fix bug when using terraform login on Windows
4b6d06cc5d Update CHANGELOG.md
dd01a35078 Update CHANGELOG.md
225466bc3e Cleanup after v0.12.23 release
85024d3100 (tag: v0.12.23) v0.12.23
```

5. Найдите коммит в котором была создана функция `func providerSource`, ее определение в коде выглядит 
так `func providerSource(...)` (вместо троеточия перечислены аргументы).

*сначала нашел имя файла, затем по файлу нашел коммиты*

✨
```
git grep -p --break --heading -n 'func providerSource'
provider_source.go
3=import (
23:func providerSource(configs []*cliconfig.ProviderInstallation, services *disco.Disco) (getproviders.Source, tfdiags.Diagnostics) {
89=func implicitProviderSource(services *disco.Disco) getproviders.Source {
187:func providerSourceForCLIConfigLocation(loc cliconfig.ProviderInstallationLocation, services *disco.Disco) (getproviders.Source, tfdiags.Diagnostics) {
```

✨
```
mikhailk@Jinhae-PC:~/devops-netology/sysadm-homeworks/02-git-04-tools/terraform$ git log -L:providerSource:provider_source.go


commit 8c928e83589d90a031f811fae52a81be7153e82f
Author: Martin Atkins <mart@degeneration.co.uk>
Date:   Thu Apr 2 18:04:39 2020 -0700
...
@@ -0,0 +19,5 @@
+func providerSource(services *disco.Disco) getproviders.Source {
+       // We're not yet using the CLI config here because we've not implemented
+       // yet the new configuration constructs to customize provider search
+       // locations. That'll come later.
+       // For now, we have a fixed set of search directories:
```

6. Найдите все коммиты в которых была изменена функция `globalPluginDirs`.

✨
```
 git grep -n globalPluginDirs
 git log -L:globalPluginDirs:plugins.go
```
```
	commit 78b12205587fe839f10d946ea3fdc06719decb05	-edit
	commit 52dbf94834cb970b510f2fba853a5b49ad9b1a46	-edit 
	commit 41ab0aef7a0fe030e84018973a64135b11abcd70	-edit
	commit 66ebff90cdfaa6938f26f908c7ebad8d547fea17 -edit
	commit 8364383c359a6b738a436d1b7745ccdce178df47	-create
```

7. Кто автор функции `synchronizedWriters`? 

✨
```
git grep -n -e 'synchronizedWriters'
Так как нет вывода, ощущение, что данной функции не существует...
```
*В качестве решения ответьте на вопросы и опишите каким образом эти ответы были получены*

---

### Правила приема домашнего задания

В личном кабинете отправлена ссылка на .md файл в вашем репозитории.

### Критерии оценки

Зачет - выполнены все задания, ответы даны в развернутой форме, приложены соответствующие скриншоты и файлы проекта, в выполненных заданиях нет противоречий и нарушения логики.

На доработку - задание выполнено частично или не выполнено, в логике выполнения заданий есть противоречия, существенные недостатки. 
