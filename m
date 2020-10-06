Return-Path: <SRS0=7v4i=DN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BB6BC4363D
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Oct 2020 12:44:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10A8E206F7
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Oct 2020 12:44:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UGbWfkci";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VhmsWAgN";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="E5M0EBf6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10A8E206F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RB/oUlvjHPmy9d1rX17ER+mcRLDlHTX76IXNLxJCVGw=; b=UGbWfkciDt4wSwz0RFi7mQNNx
	mkcRrDXBxQ40813OC+pfgz/KVr1D5lFVfaahLmykQO6JX6sucZG6+aAyjUYRAfZf7mSTHnSXK1RO8
	3TnBav9r5uvIKm2PZ4/JSmHGb1Bg3VvUtKFULfGRuK2FvozRzlnM7j1kzUT6qfTCXJo/1sTMAq3KZ
	wS/MIb7XAYK7H6bfSidRbJhozv+c2/S7ZCz0JVQ3Ah7X6xZ7DUgWagLoxsvrhe18OQTHQoHcP4c/I
	QJfnqa98N2UnzTOARhD6Jwb1w8j0rA3CRjC70cGqhRpla3UID45etHYGaZqkKwFCpJJUAnKgKhoh/
	78cdcWEpg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPmJv-0003ch-Or; Tue, 06 Oct 2020 12:43:55 +0000
Received: from galois.linutronix.de ([193.142.43.55])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPmJs-0003bZ-HC
 for linux-amlogic@lists.infradead.org; Tue, 06 Oct 2020 12:43:53 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1601988230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vAj9JE4eqj8FhfohvFYZxoqCcBarf5zqltsQxUiI1tk=;
 b=VhmsWAgNyVmBH7+ZdeqYiGj1kqUi6dTRhFBV7hC8xg7Yy6GtMZ9KpR8Hai1TOsSHr0erPg
 JPlWoQaGMAMRziJhFbs6FGfVBjJMgw7sea/7IJyc7jVAeq6efncgcJihLh73cc9vmYv5HZ
 WuCgaEO+Dt/bfw25tmlaJNyiqX4eT4E3mnsTSxPVDNhLWD4akM5i691HI444+dlvYSjSwn
 LmOQZogIdscqsg/gKxEadHv35+EsmcZuS8QhmvltqfwxMrdLYc66c8Lv+iD01P33KVU4IG
 lTTtzgolBf62iwt114zQV/3I0VO85vfFbFfhSl4Ny821OdLwD9QfWRxE104x/g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1601988230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vAj9JE4eqj8FhfohvFYZxoqCcBarf5zqltsQxUiI1tk=;
 b=E5M0EBf6SmNEwcbN4HI+3LephINpMn63Ks6D1Mx6WzzMGDnIGpiZs3/dvGpMQRdqQynHwN
 Ri0QaKPbjpUmUoAQ==
To: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH] mmc: meson-gx: remove IRQF_ONESHOT
In-Reply-To: <87wo052grp.fsf@nanos.tec.linutronix.de>
References: <20201002164915.938217-1-jbrunet@baylibre.com>
 <CAPDyKFo6T_P+TQQZSzFgHwLeE08f146KxKBpAutv209MXq0mjA@mail.gmail.com>
 <87wo052grp.fsf@nanos.tec.linutronix.de>
Date: Tue, 06 Oct 2020 14:43:49 +0200
Message-ID: <87v9fn7ce2.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_084352_674789_E3D0DF39 
X-CRM114-Status: GOOD (  16.57  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Kevin Hilman <khilman@baylibre.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Brad Harper <bjharper@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Oct 05 2020 at 10:55, Thomas Gleixner wrote:
> On Mon, Oct 05 2020 at 10:22, Ulf Hansson wrote:
>> On Fri, 2 Oct 2020 at 18:49, Jerome Brunet <jbrunet@baylibre.com> wrote:
>>>
>>> IRQF_ONESHOT was added to this driver to make sure the irq was not enabled
>>> again until the thread part of the irq had finished doing its job.
>>>
>>> Doing so upsets RT because, under RT, the hardirq part of the irq handler
>>> is not migrated to a thread if the irq is claimed with IRQF_ONESHOT.
>>> In this case, it has been reported to eventually trigger a deadlock with
>>> the led subsystem.
>>>
>>> Preventing RT from doing this migration was certainly not the intent, the
>>> description of IRQF_ONESHOT does not really reflect this constraint:
>>>
>>>  > IRQF_ONESHOT - Interrupt is not reenabled after the hardirq handler finished.
>>>  >              Used by threaded interrupts which need to keep the
>>>  >              irq line disabled until the threaded handler has been run.
>>>
>>> This is exactly what this driver was trying to acheive so I'm still a bit
>>> confused whether this is a driver or an RT issue.
>>>
>>> Anyway, this can be solved driver side by manually disabling the IRQs
>>> instead of the relying on the IRQF_ONESHOT. IRQF_ONESHOT may then be removed
>>> while still making sure the irq won't trigger until the threaded part of
>>> the handler is done.
>>
>> Thomas, may I have your opinion on this one.
>>
>> I have no problem to apply $subject patch, but as Jerome also
>> highlights above - this kind of makes me wonder if this is an RT
>> issue, that perhaps deserves to be solved in a generic way.
>>
>> What do you think?
>
> Let me stare at the core code. Something smells fishy.

The point is that for threaded interrupts (without a primary handler)
the core needs to be told that the interrupt line should be masked until
the threaded handler finished. That's what IRQF_ONESHOT is for.

For interrupts which have both a primary and a threaded handler that's a
different story. The primary handler decides whether the thread should
be woken and it decides whether to block further interrupt delivery in
the device or keep it enabled.

When forced interrupt threading is enabled (even independent of RT) then
we have the following cases:

  1) Regular device interrupt (primary handler only)

     The primary handler is replaced with the default 'wake up thread'
     handler and the original primary handler becomes the threaded
     handler. This enforces IRQF_ONESHOT so that the interupt line (for
     level interrupts) stays masked until the thread completed handling.

  2) Threaded interrupts

     Interrupts which have been requested as threaded handler (no
     primary handler) are not changed obvioulsy

  3) Interrupts which have both a primary and a thread handler

     Here IRQF_ONESHOT decides whether the primary handler will be
     forced threaded or not.

     That's a bit unfortunate and ill defined and was not intended to be
     used that way.

     We rather should make interrupts which need to have their primary
     handler in hard interrupt context to set IRQF_NO_THREAD. That
     should at the same time confirm that the primary handler is RT
     safe.

     Let me stare at the core code and the actual usage sites some more.

Thanks,

        tglx







_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
