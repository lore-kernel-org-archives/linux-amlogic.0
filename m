Return-Path: <SRS0=Ba+r=QY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5F37C43381
	for <linux-amlogic@archiver.kernel.org>; Sun, 17 Feb 2019 14:14:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B242218F0
	for <linux-amlogic@archiver.kernel.org>; Sun, 17 Feb 2019 14:14:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IMgtEaTN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="bck800rB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B242218F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ui7mTcLIq4kQx/5Pm7OPKdCRrPcrbVmHeOO5nq2PpjI=; b=IMgtEaTNbNJ1CV
	XeEcoyW/bxZ4XeBlHLor47FmmTlgt7PPrA6V7SjtBgGufwaXw2GI/e+ShVnzJK7mCT8ladB6XuxHS
	fIIJ2H0nSF/3zWHXhHA4VN3eK+lEsbvawTqS12exfXED6cHaQShnDJMeHBSiTMiGbfo92wNGlHMgV
	1yyjbw5q+CzDDkigKCUJa0Axcfi97ee4GMvuMzHi/c1ZNRQUO2/8T230RT/w+WkJ2h31ca8aY+j4L
	+Jz97IjITluQMIzhjSdrniUiMMvhCRHVlcopUtG6fDOyExKtv60lDUAAZUbfwoC1y/DGSDIinf8fg
	mNiOZZvrhicb1my+y+wQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gvNCe-0002fe-6q; Sun, 17 Feb 2019 14:13:56 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gvNCa-0002fN-Oe
 for linux-amlogic@lists.infradead.org; Sun, 17 Feb 2019 14:13:54 +0000
Received: by mail-ot1-x334.google.com with SMTP id 98so24200744oty.1
 for <linux-amlogic@lists.infradead.org>; Sun, 17 Feb 2019 06:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y9yIPsejKt7M+rKnN+CViUhK/7Ifq8U8t1V7vv1P9Vw=;
 b=bck800rB/QqTtouBeTZHIIj4006IBZ+r9xR8w3k7HpBq7ned++VcsV2G2UMUDeIFRX
 f8ftq33oUc+hJU+J/gHuliNPQBzH7iLgGRfAVlsT8WLzZiUBTlBBqhAxL2LP0cdIpJaW
 Lz6Pd6QNTYWujM53KZp/++5hYIDAKn3PxdvPo/x0zePud290EgtXynhNRCJ2hLdJBMJy
 wuCsaa9Vr16SBIdMslYWqkQjhUrk/RrSBWZxVIhnwo/Krxot+tLC96Y2OZ9QIOaGGBzw
 1v2thrpeA+IGxEaWvV38Vhn8DsUbqGEf2dq6t6C7NrrjXVFAOzBoObAVuKWUIJtyMEf1
 8k1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y9yIPsejKt7M+rKnN+CViUhK/7Ifq8U8t1V7vv1P9Vw=;
 b=S6MtPVV538t5DY1Q0PzeyBZzxcQZg/nnRjEJ/jXjG8ylbCcmBB6q2kNPEmaxVvN8LL
 lgpkVe4KZg/cDCU/GEn67mAjRo+Lf6PUUY6ait+NjNYCkgsEOwpAV9LMcqJF1JU+8bGQ
 y34yz2FlqwlM4XuCG7j7iebqPIOp7BtVtKXbxn4IESsbQpqjOzXQJLfEimNhir+6a4+m
 BxbP1uxG4oF21GjjFKmKIQE/faIxVwDT23I3ESR2HWb01OScCIA6cIgMe1Ir9DLybRuu
 Bf3dCOqfdGQETtTWBSs0XA68A5JsyHxgNBbJG31kwPV0llYz+7+Iui9TonQV5voAzoEz
 blkQ==
X-Gm-Message-State: AHQUAuYgs63I5E6D6VDJHSf0yGTMpVFw58nZFGgtJyfWdpOoNu4uAHfW
 keD+Q+x2lA5LvwixEIcg1OSk0ni9qDMK1TNYAW0=
X-Google-Smtp-Source: AHgI3IY7l5Jza97LkoKtkkxK+MmDHKCN6J3zKKY9IO3G6Lc+dBtqJJYfbPTN55++y9Iye3n22Biam2hhao6lZ9pBXJU=
X-Received: by 2002:aca:aacb:: with SMTP id
 t194mr12084559oie.129.1550412831639; 
 Sun, 17 Feb 2019 06:13:51 -0800 (PST)
MIME-Version: 1.0
References: <CAPo5REH3dQww=+Jv4U5dh1m8JpsGN+J0Bs500hLhrq-dJyM60A@mail.gmail.com>
 <CAFBinCCnfVjKaB5pPcBphvuZgwa1QSD0DSHe0DHPT=dH-wBisg@mail.gmail.com>
 <CAPo5REFbUZ6fTZUAPJPqCnBK2Yt7BcCUfFm0GAhZWROf5Oe8yA@mail.gmail.com>
In-Reply-To: <CAPo5REFbUZ6fTZUAPJPqCnBK2Yt7BcCUfFm0GAhZWROf5Oe8yA@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 17 Feb 2019 15:13:40 +0100
Message-ID: <CAFBinCC5YORZB2X7ypHZHaxqjkkwAcOxmpWG05KEq_Q6Y0Lc3A@mail.gmail.com>
Subject: Re: Odroidc1 DVFS
To: Piero <ottuzzi@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190217_061352_828129_B3242676 
X-CRM114-Status: UNSURE (   9.74  )
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

Hi Piero,

On Tue, Feb 12, 2019 at 11:27 AM Piero <ottuzzi@gmail.com> wrote:
>
> Hi Martin,
>
>    I recompiled integ branch with CONFIG_PWM_MESON=y and now DVFS is
> working as expected.
great - thank you for the feedback! :)

> I did some tests using sbc-bench:
>
> * Original Odroid Ubuntu 16.04 with 3.10 kernel (1824MHz): http://ix.io/1zdB
> * Armbian 5.75 with 5.0.0-rc5 kernel (1536MHz DVFS): http://ix.io/1APH
>
> Original 3.10 kernel has a big big margin on tinymembench (about twice
> as fast as 5.0.0-rc5 with DVFS); 3.10 is 50% faster in OpenSSL and
> both kernels are tie on 7-zip (a bit faster 5.0.0-rc5). Do you have
> any idea on how to explain the difference in tinymembench? I do not
> think 300MHz overclocking is enough to explain the difference.
Did you compare kernel 3.10 with 5.0.0-rc on other hardware as well?
I have no idea why it there's such a huge difference between these two
kernel versions (in some of your tests). The only thing that came to
my mind is all the hardening for the "spectre" vulnerabilities, but I
can't tell if for example tinymembench really suffers from that.


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
