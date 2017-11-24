From: sjg@chromium.org (Simon Glass)
Date: Fri, 24 Nov 2017 15:35:44 -0700
Subject: [PATCH v2 3/5] board: p212: use common ethernet init function
In-Reply-To: <1511357151-3771-4-git-send-email-narmstrong@baylibre.com>
References: <1511357151-3771-1-git-send-email-narmstrong@baylibre.com>
 <1511357151-3771-4-git-send-email-narmstrong@baylibre.com>
Message-ID: <CAPnjgZ0FQcKtZ=6+y-Aqn3P2Xvw1jSmFRq3Y-QTTs-aO3m1GuA@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 22 November 2017 at 06:25, Neil Armstrong <narmstrong@baylibre.com> wrote:
> Switch P212 Ethernet init to the common Ethernet init function.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  board/amlogic/p212/p212.c | 14 ++------------
>  1 file changed, 2 insertions(+), 12 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
