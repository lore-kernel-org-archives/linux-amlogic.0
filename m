From: sjg@chromium.org (Simon Glass)
Date: Thu, 9 Jun 2016 17:36:05 -0700
Subject: [PATCH 1/2] configs: gxbb: Introduce a common config header file
In-Reply-To: <1465483543-2240-2-git-send-email-carlo@caione.org>
References: <1465483543-2240-1-git-send-email-carlo@caione.org>
 <1465483543-2240-2-git-send-email-carlo@caione.org>
Message-ID: <CAPnjgZ3KifMiYLjqbtrG1gK8rsrKHJaZYBVCdNOwza94Z31vkw@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 9 June 2016 at 08:45, Carlo Caione <carlo@caione.org> wrote:
> From: Carlo Caione <carlo@endlessm.com>
>
> Introduce a meson-gxbb-common.h header file and derive the
> configuration for Hardkernel Odroid-C2 board from that.
>
> Signed-off-by: Carlo Caione <carlo@endlessm.com>
> ---
>  include/configs/meson-gxbb-common.h | 45 +++++++++++++++++++++++++++++++++++++
>  include/configs/odroid-c2.h         | 34 +---------------------------
>  2 files changed, 46 insertions(+), 33 deletions(-)
>  create mode 100644 include/configs/meson-gxbb-common.h

Reviewed-by: Simon Glass <sjg@chromium.org>
