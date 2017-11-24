From: sjg@chromium.org (Simon Glass)
Date: Fri, 24 Nov 2017 15:35:41 -0700
Subject: [PATCH v2 2/5] board: odroid-c2: use common ethernet init function
In-Reply-To: <1511357151-3771-3-git-send-email-narmstrong@baylibre.com>
References: <1511357151-3771-1-git-send-email-narmstrong@baylibre.com>
 <1511357151-3771-3-git-send-email-narmstrong@baylibre.com>
Message-ID: <CAPnjgZ2yRcyQRZd+xovT-k9jHrNVaYAULAeaMWRrEa+gxMAFrg@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 22 November 2017 at 06:25, Neil Armstrong <narmstrong@baylibre.com> wrote:
> Switch Odroid-C2 Ethernet init to the common Ethernet init function.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  board/amlogic/odroid-c2/odroid-c2.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
