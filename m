Return-Path: <SRS0=3vaB=QP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19EDCC282CB
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Feb 2019 19:44:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D523C2177B
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Feb 2019 19:44:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Nne9BYNd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Rxmdn8JV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D523C2177B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6pCgKdxmYi7p0XuvsxtypoY+EUy6tZY6P4GZjAqDriU=; b=Nne9BYNdx/4NFO
	rSHj+8PfIHHeg+Pl49HczzqpYdDwXBBndcPGTgY1x6dVAm7A181BRD1XrMlYGb+ItbMPYtXb9Drsm
	nQC4TcHzPA1L9g7uK18sHP6du3sjmXxHyE0b5g4yKXODY/lpHBdBzgibA7ObkMrq4TkGAc2b6eJy+
	oNcNDYlLcp/uQftMFD780cW0s11ahoVrbDLqKYjSHhC77GlXq+Ot5cfAmd8mthLcKR1AA8/iBFepu
	AS4V88rfOgGfyWSKJqoKMQpb77uhdIgefgrXHWGpNa/JRkUeU32sVPN5xklFGtVAONDcAwq3KxrzJ
	Jntryv79PzHt7aUaG7eA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gsC4X-0003LT-Lf; Fri, 08 Feb 2019 19:44:25 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gsC4V-0003LA-CE
 for linux-amlogic@lists.infradead.org; Fri, 08 Feb 2019 19:44:24 +0000
Received: by mail-ot1-x32d.google.com with SMTP id e24so7739113otp.11
 for <linux-amlogic@lists.infradead.org>; Fri, 08 Feb 2019 11:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0gj73Eq7KORGLu5kpJtfXxDvbV1NWQHvlfq8SYzy3b4=;
 b=Rxmdn8JVARXFjbdZxQFJyvuEwIdKyyHakOfHwazsvx41FQay556Smqj40PiVjRk3ot
 bE2reco8J257EPdeIhlSAmAwLnAZjjTPMvsUsuvqFz0vwjRFi+u8B8bsb4uRI0Wx7xiI
 U0sQQotQg+zZkM+7LhZKCgp4CiR3UVoSJwIq1+xNvIfUI2/atiyvm+cb4owmiyVdN7aS
 ckf0zeS8MZn5by3bONTQ8HYhI9ngciRJYTOp63NLxQeJrHdVMLy+GIUu5kGNZvigdx5b
 VSZ6RU2biS1E7q1xWjm+Uf4s3ki2IeOCcFKtptQ0U9YZwKNohWnNBBgUH3AMuI8Fohfu
 pduQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0gj73Eq7KORGLu5kpJtfXxDvbV1NWQHvlfq8SYzy3b4=;
 b=SbRMDANz5odcg20SifD+luyAkGnnZ63GN4CH1Xq97WZ9SWw3m8jQbWqz/rzIIzBM2r
 s96DpWQVXFikw4Ny/RkjonsHK6mLwl+L1EYQw8cxnRcLLVnXVZQvQWA3RFkMzQy5vJg8
 pYf9CtvzENqjmoXcWgB8GzmQoMaYNaKerCI0zUeP0PI8f/ClScu/TRr3QoyqpchnNCqg
 N0QYiH37pKotUYazaFCrlF8ovlH0ERHrbgpagrMimcRUX4Wx41ZamCekcwAIOroU4ISB
 erwA+4z/Djt0dCYbg5DFG/7NC04Wk/ATkrLWA2a92mIoZXyxRIqZsBKoc3yhM8cY7TCY
 iqhQ==
X-Gm-Message-State: AHQUAubT1oHEgmEHkNcF0F7n+NG+10kIeWYuPKbm4DnbrHYcRZK3v/Mx
 7d2clAnC9bOKDg2SlRYFeBTZIhbKDLu1AROUjN7hRepy
X-Google-Smtp-Source: AHgI3Ib1dboDu8O25/m0xDOodTeRUPluCB1/040Z2qMF0Ze8EOW/nxnzJ/F232hICYRpZeLydpmckouTLnRUkWLvPNA=
X-Received: by 2002:a05:6830:2010:: with SMTP id
 e16mr14035404otp.86.1549655062387; 
 Fri, 08 Feb 2019 11:44:22 -0800 (PST)
MIME-Version: 1.0
References: <CAPo5REH3dQww=+Jv4U5dh1m8JpsGN+J0Bs500hLhrq-dJyM60A@mail.gmail.com>
In-Reply-To: <CAPo5REH3dQww=+Jv4U5dh1m8JpsGN+J0Bs500hLhrq-dJyM60A@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 8 Feb 2019 20:44:11 +0100
Message-ID: <CAFBinCCnfVjKaB5pPcBphvuZgwa1QSD0DSHe0DHPT=dH-wBisg@mail.gmail.com>
Subject: Re: Odroidc1 DVFS
To: Piero <ottuzzi@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190208_114423_442347_E6119AF0 
X-CRM114-Status: UNSURE (   8.21  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On Thu, Feb 7, 2019 at 3:53 PM Piero <ottuzzi@gmail.com> wrote:
>
> Hi,
>
>    looking at linux-meson website[1] it looks like DVFS is available
> for odroidc1 but from my test compiling 5.0.0-rc5 from amlogic integ
> branch[2] I cannot see it working: what am I missing?
can you please show us your kernel .config as well?
I believe you're missing the PWM driver: CONFIG_PWM_MESON

> Attached you can find dmesg.
pwm-regulator regulator-vcck: Failed to get PWM: -517
it's "OK" that this message is shown a few times (assuming you have
CONFIG_PWM_MESON=m). Linux will solve it once modules are loaded, then
you'll get the following message:
pwm-regulator: supplied by regulator-dummy
(from that point on "lscpu", "cpupower frequency-info" or other tools
should show DVFS support)


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
