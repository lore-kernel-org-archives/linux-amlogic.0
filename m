Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFBE0CDB46B
	for <linux-amlogic@archiver.kernel.org>; Sat, 20 Jun 2026 13:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YYvukoFRkov/o/zLipgFkSjfXG5gm2ToJJLxPyecKlY=; b=p6XZRd7YUQM1xH
	8g9is26ovuASMSdI8pvZIn+/RPctsgeavu9qnU2cLujq96CAsI0pfPJxZ5wv2jnLHH+AyREY1DDkt
	31rtvNiVc39AdZws5PJVZhU4fM1Rb3rp9Vkl2U23k9WKsTGTIXKz/vUM+7BNLEqLsa9tulyyKXiNx
	UACzV7oWVj6hEblbIGe2EDBijlQ4umH/Gd9ntgQGA9jJoaU2U9j7PhMbXAyP6WZBOrYlQG4koI1z1
	Nb4wHr7OLbhepU7FW0aPngwF/BNQkNEsvzCVOjFUpdqtXCJUYPNyaZ6YlCbs6+fmBT4AdwDYmZ1s0
	pI+rMH1lhxMfddNUkn1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waw0k-00000003OIV-1KOT;
	Sat, 20 Jun 2026 13:45:26 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waw0g-00000003OHi-2C9W
	for linux-amlogic@lists.infradead.org;
	Sat, 20 Jun 2026 13:45:24 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-c0be5e548a4so161911366b.3
        for <linux-amlogic@lists.infradead.org>; Sat, 20 Jun 2026 06:45:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781963120; cv=none;
        d=google.com; s=arc-20240605;
        b=QUsip8/XKZPgXmHLWRcEQyg/TpoJU77BS+TWuoR4PWYXrqLMEfigXMd3cidbv8WhuZ
         NzZvD/mOllXebVm8llbZvlMGq4cnQY4qjtW0xOvJKxwfB3o3bNldbU+AJTp+rE1T0M32
         61WnHbQw2byCjhkhpPjMEZGhnbmXIFOK94EgbITPHLXxdmbBP9pwm2ikz+EOj561kCV7
         gcLFjWncAThq+8+X7LcAiQpEvjWqCaPLEmX9JOPOs4mghSTR9SmZJ1lHufc1vFOO0Ju6
         RpXD6zbLDVkocmbm9jc4aw6AuLFIZs614ReGVenXK4AeONRjd0+Rj8yEGbcDMAGfExoA
         fZHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=utXWx3oSNzw96wlO+XOiybZZ9LJhhovVhCeiDDuSymI=;
        fh=LhPkhLnbNq8nZ+TU4ZZJBvNYLLuFUwequEDvUAvM510=;
        b=AmQAAGt6WeAJbY8tZXO45CHDS5VWJH29DxLKPR2I/IG3Ke4KP8QD87BD4vvHJx9s17
         Ezr3BBupxig0rhOQdea2IY8HKLGUn/2N6nXKtDCVq9cVTwqCdx7N7WsmLIi2pLTS7MD2
         bTX98dHgfFslKu/Jv34XO1dr+drKeaa+K0PqZd2UCqQ9T4qrMZP3Kbe0hukxLnI8dfaR
         FVjnA2bg1pP2E9t8vUny7qxTCf9jGAS9RtT5ViZcK6cYtM1TJzJxxkLjYKGdp6HK696+
         6HsE0Tx0ACEECjrI0QljR7r3GFKRThbe6Jpwk+EEgGAW7Peq417ubRNdDdHzkJ0O5FIj
         Eqag==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781963120; x=1782567920; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=utXWx3oSNzw96wlO+XOiybZZ9LJhhovVhCeiDDuSymI=;
        b=jHK0Ce/vVALLoZot8VP16WarT6184I9ojjQeRMGGU3v3odpTtClPxc0peJ+aGN6BGK
         N+Dtcm0BwC0yorFFLCAwz7XRegC+lQQ0XCyv8QU/7ANEBLDBomIOmUVGQQu71lLrpdQm
         1jvnAHlJTFiuEhErYAXdbIKQYigCM3jgae+TZV8yXQhsPOwuzlnVECgDuI2OF5TgaG2g
         lJjDsL+/hEYxgNjBqp2xO4kp/KsnOEp0SZPp2Mpuz97Wh2Twz+2xPKqcAC/LqiejSUTN
         dLCvO9ZQyuNy5jtU580Nlh2KLub7Y7m1Ya4L/69JV1UrdIwpSoM58mzNDJ4q10KGCH6c
         nXpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781963120; x=1782567920;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=utXWx3oSNzw96wlO+XOiybZZ9LJhhovVhCeiDDuSymI=;
        b=Z0Iezk7Bc2SvSSZ86VLgMcTdFRx/AlnyMuUH8L7DSv8Uf7d2W+FOqlllpq3bcq8LIz
         buBsqOKpjc7i2AmDGRcxn69sleAcOYREtFaaXsgoHl+T5ee3HbE/nK0mDIkGotUohTkf
         4aj/GxXyoBa5T6jTd/82nSkdBxkqqH6LBxgbZUvlwIIT1QGis/yvB5r+DkZqC4521xe/
         PGIJ6JhJTtYJbdthY+M7CjVJjXs5dzvsKYGXn+7v90AwPp4R9XFVMjHHVv5J4jq9oQDO
         0o5xXaXYyXlThBAVvnyMJCegeP/foQkwJjz3SZ/XSjQXI1TcVKaZdqWLGcKtr3p5qB73
         MK/g==
X-Forwarded-Encrypted: i=1; AFNElJ+4eXM1y47XmmcIN7o5uApDtxRiUMUzsgdH/qh70hvwmsgehY4vB+XzTN607Nd9Q9lq7JLVgsZros7PCi/I@lists.infradead.org
X-Gm-Message-State: AOJu0Yzg2UHxhO2X/nAN6p9z4BNJkd4mMjqCfIw8gWTW83ic9qub828S
	rT1jE94L0SK0oDO8r7zD+u/M2dvnaQ7H3mFKoPsVAdCrCUtHeyf2J3XIGZnB0lyh7DV7h5Kusgc
	n+t7CbxKp2ODbOA8zp/HBtRW66FisLFg=
X-Gm-Gg: AfdE7cmO4RvG8QOdcpsru7PVkpMTUSgeEGqSvncSvR4JBXhNk4lSjFKUtZ9v4lwshrA
	KbnjUUYCtePDr638jAVESUvGccAQqCSYEJvCuILabviipz/2URBbfZR8OTT/PAVZcs+l7EAepzu
	1bx24klJUhgea+stzGAgrKwm6opOdQnVTcQBuJyUlyyoYnzhb9u8FwH3A+aAWCoyUW62YZMEY3q
	fkhVRrdTS1wiiiOqIjRO4YyYoVZ+lWWz1v58+qCow0t0szKY9yvkTPLGGQ16vPHE8e9P35cTQQM
	PhADtA==
X-Received: by 2002:a17:907:e110:b0:c0c:63bb:f422 with SMTP id
 a640c23a62f3a-c0c63bbf546mr86176966b.43.1781963119757; Sat, 20 Jun 2026
 06:45:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260616074952.93076-1-doruk@0sec.ai> <20260617074123.32464-1-doruk@0sec.ai>
In-Reply-To: <20260617074123.32464-1-doruk@0sec.ai>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 20 Jun 2026 19:15:04 +0530
X-Gm-Features: AVVi8Ceek5KHZhoQI3N5eXAU25nCx3k1CHygVioQTDscbsZIHW26iKArybAPhdM
Message-ID: <CANAwSgQ0FdonxfZ8V=tPB8rBiyFj3fV-1tqJA0-RN9=AYvoBpQ@mail.gmail.com>
Subject: Re: [PATCH v2] media: meson: vdec: fix use-after-free of decode work
 in stop/close path
To: Doruk Tan Ozturk <doruk@0sec.ai>
Cc: neil.armstrong@linaro.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	hverkuil@kernel.org, jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, 
	linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260620_064522_612736_98206F2B 
X-CRM114-Status: GOOD (  24.78  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Doruk,

On Wed, 17 Jun 2026 at 13:11, Doruk Tan Ozturk <doruk@0sec.ai> wrote:
>
> Please drop v1 and v2 -- both are wrong, and the sashiko review was right
> about the deadlock.
>
> The underlying bug is real: vdec_close() does kfree(sess) (and
> v4l2_m2m_ctx_release() frees sess->m2m_ctx) without cancelling
> sess->esparser_queue_work, whose worker dereferences sess->lock and
> sess->m2m_ctx -> UAF if it is pending/running at teardown.
>
> But cancelling on the streamoff/poweroff path can't work:
>
> 1) Deadlock. The worker takes sess->lock. For an m2m fh the ioctl core
>    takes m2m_ctx->q_lock (== sess->lock) for VIDIOC_STREAMOFF and holds it
>    across the handler, so vdec_stop_streaming() -> vdec_poweroff() already
>    runs under sess->lock; cancel_work_sync() there waits on a worker blocked
>    on that same lock.
>
> 2) Use-after-power-down. v2 also cancelled after vdec_ops->stop(), which
>    power-gates VDEC1 (__vdec_1_stop()), while the worker still reads a VDEC1
>    register (vdec_1_vififo_level() -> VLD_MEM_VIFIFO_LEVEL).
>
> The only deadlock-free point I see is vdec_close() (the ->release fop, not
> under sess->lock), cancelling before v4l2_m2m_ctx_release() -- but that
> still leaves the threaded VDEC ISR (amvdec_dst_buf_done() ->
> schedule_work()) able to re-arm the worker, and there are adjacent teardown
> issues (esparser_isr() vs the dos_parser_clk disable;
> vdec_decoder_cmd()/esparser_queue_eos() without sess->lock).
>
> I don't have Meson hardware to validate a corrected fix. Is a
> vdec_close()-only cancel (plus quiescing the VDEC IRQ outside sess->lock)
> the direction you'd want, or would you rather take it given the HW testing
> and the surrounding teardown concerns?
>
Actually, I've been working on this issue for a while and have made a few
changes. I really like your approach, so I'd like to integrate
it alongside my cleanup changes. It should solve this issue.

diff --git a/drivers/staging/media/meson/vdec/esparser.c
b/drivers/staging/media/meson/vdec/esparser.c
index 4632346f04a9..c5b909c6a2b7 100644
--- a/drivers/staging/media/meson/vdec/esparser.c
+++ b/drivers/staging/media/meson/vdec/esparser.c
@@ -375,6 +375,9 @@ void esparser_queue_all_src(struct work_struct *work)
        struct amvdec_session *sess =
                container_of(work, struct amvdec_session, esparser_queue_work);

+       if (READ_ONCE(sess->should_stop))
+               return;
+
        mutex_lock(&sess->lock);
        v4l2_m2m_for_each_src_buf_safe(sess->m2m_ctx, buf, n) {
                if (sess->should_stop)
diff --git a/drivers/staging/media/meson/vdec/vdec.c
b/drivers/staging/media/meson/vdec/vdec.c
index 51ea7beef811..de3a660d22b1 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -448,6 +448,9 @@ static void vdec_stop_streaming(struct vb2_queue *q)
        enum amvdec_status old_status;
        bool full_cleanup = false;

+       sess->should_stop = 1;
+       cancel_work_sync(&sess->esparser_queue_work);
+
        /*
         * Secure the hardware lock for the ENTIRE state evaluation
         * sequence to block concurrent start_streaming() callers.
@@ -1000,6 +1003,9 @@ static int vdec_close(struct file *file)
 {
        struct amvdec_session *sess = file_to_amvdec_session(file);

+       sess->should_stop = 1;
+       cancel_work_sync(&sess->esparser_queue_work);
+
        if (!IS_ERR_OR_NULL(sess->recycle_thread)) {
                kthread_stop(sess->recycle_thread);
                sess->recycle_thread = NULL;

> Doruk
>
Thanks
-Anand
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
