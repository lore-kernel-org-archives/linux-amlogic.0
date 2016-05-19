From: sjg@chromium.org (Simon Glass)
Date: Wed, 18 May 2016 21:59:30 -0600
Subject: [PATCH v7 1/4] arm: implement generic PSCI reset call for armv8
In-Reply-To: <1462689017-3160-2-git-send-email-b.galvani@gmail.com>
References: <1462689017-3160-1-git-send-email-b.galvani@gmail.com>
 <1462689017-3160-2-git-send-email-b.galvani@gmail.com>
Message-ID: <CAPnjgZ0yGRvvgfuBGbtDrnn06iqoJTGiANkcnke2_NQhZnx-TQ@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 8 May 2016 at 00:30, Beniamino Galvani <b.galvani@gmail.com> wrote:
> Add a psci_system_reset() which calls the SYSTEM_RESET function of
> PSCI 0.2 and can be used by boards that support it to implement
> reset_cpu().
>
> Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
> ---
>  arch/arm/cpu/armv8/fwcall.c   | 16 ++++++++++++++++
>  arch/arm/include/asm/psci.h   | 17 ++++++++++++++++-
>  arch/arm/include/asm/system.h |  2 ++
>  3 files changed, 34 insertions(+), 1 deletion(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
