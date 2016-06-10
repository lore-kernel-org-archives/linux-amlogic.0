From: sjg@chromium.org (Simon Glass)
Date: Thu, 9 Jun 2016 17:36:07 -0700
Subject: [PATCH 2/2] board: amlogic: Rename folder for Amlogic boards
In-Reply-To: <1465483543-2240-3-git-send-email-carlo@caione.org>
References: <1465483543-2240-1-git-send-email-carlo@caione.org>
 <1465483543-2240-3-git-send-email-carlo@caione.org>
Message-ID: <CAPnjgZ1zDSUbUh0YkXD4f+SD6rZU+Q8B8rW9+w-qnkg59xus3w@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 9 June 2016 at 08:45, Carlo Caione <carlo@caione.org> wrote:
> From: Carlo Caione <carlo@endlessm.com>
>
> s/hardkernel/amlogic/ to have a single place for all the amlogic-based
> boards.
>
> Signed-off-by: Carlo Caione <carlo@endlessm.com>
> ---
>  arch/arm/mach-meson/Kconfig            |  2 +-
>  board/amlogic/odroid-c2/Kconfig        | 12 ++++++
>  board/amlogic/odroid-c2/MAINTAINERS    |  6 +++
>  board/amlogic/odroid-c2/Makefile       |  7 ++++
>  board/amlogic/odroid-c2/README         | 60 ++++++++++++++++++++++++++++++
>  board/amlogic/odroid-c2/odroid-c2.c    | 67 ++++++++++++++++++++++++++++++++++
>  board/hardkernel/odroid-c2/Kconfig     | 12 ------
>  board/hardkernel/odroid-c2/MAINTAINERS |  6 ---
>  board/hardkernel/odroid-c2/Makefile    |  7 ----
>  board/hardkernel/odroid-c2/README      | 60 ------------------------------
>  board/hardkernel/odroid-c2/odroid-c2.c | 67 ----------------------------------
>  11 files changed, 153 insertions(+), 153 deletions(-)
>  create mode 100644 board/amlogic/odroid-c2/Kconfig
>  create mode 100644 board/amlogic/odroid-c2/MAINTAINERS
>  create mode 100644 board/amlogic/odroid-c2/Makefile
>  create mode 100644 board/amlogic/odroid-c2/README
>  create mode 100644 board/amlogic/odroid-c2/odroid-c2.c
>  delete mode 100644 board/hardkernel/odroid-c2/Kconfig
>  delete mode 100644 board/hardkernel/odroid-c2/MAINTAINERS
>  delete mode 100644 board/hardkernel/odroid-c2/Makefile
>  delete mode 100644 board/hardkernel/odroid-c2/README
>  delete mode 100644 board/hardkernel/odroid-c2/odroid-c2.c

Reviewed-by: Simon Glass <sjg@chromium.org>

Although I'm surprised this did not come through as a rename in your patch.

- Simon
