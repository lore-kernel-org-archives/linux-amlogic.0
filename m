Return-Path: <SRS0=X3sA=LM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 843F7C48BE8
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jun 2021 15:35:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 412B46120A
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jun 2021 15:35:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 412B46120A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W/0NYrCRwVUBbeJxaKEdi2I4YpNs+GeVv+zpq550W4c=; b=aIgFjiOzqziGdE
	CVYewZ4ZfVSXztccK0veKPCt7xLMzfvsT31YUzZTPOoefURmcUfdqRpBU7U9L6smsxnj0U/Xo9Zap
	o3Um4u5sS1xnp3zi6s7ad1xrFsktddjdR+tQaqjtAsTUNEUNH+eLRym98Do+QoAjLsCMctfmT7A3t
	iyiShj+yAJX1ZelihvyJi8UjZpqg3MU4QZS7rigBWZ6nREYjB7cQJHMM56Leizdt0wNBtYmAjk52Y
	Prx4hLswJkeq3t/nhmKPygBeaIPrRsa/t4fK0f57H++Ddj687Fs8HimVGrfPlzQp/EdcYD5uiznMm
	A76sHQZanAVi9Gq/BgZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luGWc-00EmFV-32; Fri, 18 Jun 2021 15:35:18 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luGVW-00Elbo-UJ; Fri, 18 Jun 2021 15:34:12 +0000
Received: by mail-ej1-x62a.google.com with SMTP id ji1so10422960ejc.4;
 Fri, 18 Jun 2021 08:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KpCm5HqaoEkPNbQiojzQ8l9+3E69oFCh0+FoMDmFeh4=;
 b=MactzmFW0XABE7AExi4kBxs63YPf+yunoMYq+qM5FFhLpVHUw8gEmJj6IbOkWDBQdr
 2VIvZVk9Vy+CpY2TSVx8lgs6J7EfMTwAMgPhfbb7a6WDgp/vcPLOfqO9XgLoj6/0lVVV
 g9W3Py8MvGtm4/WQCZhnGkmSyTwWbpAXGj5Uk1iJv7cgPzOrJdzf+KpAd3BZmpI47MVT
 WHECmkvnXIAdpWVPwEKOVW44ajl+OVN71VcQgC6I2WKptBJckf/xlVnSpAVS2RViTOP7
 0GpR64HTa73N6kn85zp+zPrCOYS1XTomSp8n6VsaFBN/Z6Eukzfn0zByARVHmtgwhMs5
 fkSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KpCm5HqaoEkPNbQiojzQ8l9+3E69oFCh0+FoMDmFeh4=;
 b=AY5j6Jfc1/T/n91P3J8JcBIqpVqM6qP3pgN9OblL0RD95BivFeATrZRqtbUf1zNYb5
 jKg5m+PnkQIdivnrGcLrfUbQ9KvmPwmqOBa2XciyqrpskaOQ2GSFT2ZcubSTiNmHrGIr
 yxISed/D6F6TN8TjuXr5BxxVFyjN+PNJFzRWoguZR7jqOLKqKhyqhs6ReLuZCua92x7w
 1s4CcLNhtVEyKKDQvecipT/3iG7j+8XELqgSYrzjeBbmEdlA5X94A1r6jrN9ceW4J+gC
 PaffLtv8Xy747QeuPJCFB/e+Zl8Do5akTssKuoReRSKEw2oH/vHo6GeAZ78zn38lVI/m
 nvkA==
X-Gm-Message-State: AOAM5322UguVNqdwq6gaes6pd2FzYkdIL4ZUhnSWp08CO9T42vR+IYoU
 0/gg8CRrVyHxgqKBhy34f/0/Y5UMxg8+U/+qyms=
X-Google-Smtp-Source: ABdhPJxUm2je64XwNMhTthmRUU5/BtOXPNJD5uuJE0r7hQUcZ7mgQZmOIQ3HW3fBRtxL7fQKlfTKElduF5w2vqTV9hM=
X-Received: by 2002:a17:906:5407:: with SMTP id
 q7mr11951545ejo.158.1624030449498; 
 Fri, 18 Jun 2021 08:34:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210617194154.2397-1-linux.amoon@gmail.com>
 <20210617194154.2397-6-linux.amoon@gmail.com>
 <CAFBinCD1dJ=oqjzkCrAdMMdxF8W1Aujcwo20vJ1oLv=mtn5TZw@mail.gmail.com>
In-Reply-To: <CAFBinCD1dJ=oqjzkCrAdMMdxF8W1Aujcwo20vJ1oLv=mtn5TZw@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 18 Jun 2021 21:03:57 +0530
Message-ID: <CANAwSgT9cdk5eWsDnpJ5TZt2i1hCdiW3BvXDQp4dN5BgtGZM=w@mail.gmail.com>
Subject: Re: [RFCv1 5/8] phy: amlogic: meson8b-usb2: Reorder phy poweroff
 callback function
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-phy@lists.infradead.org, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-amlogic@lists.infradead.org, 
 Linux Kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_083411_043113_FBB3B700 
X-CRM114-Status: GOOD (  11.38  )
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

Hi Martin,

On Fri, 18 Jun 2021 at 03:47, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Anand,
>
> On Thu, Jun 17, 2021 at 9:44 PM Anand Moon <linux.amoon@gmail.com> wrote:
> >
> > Move the phy_meson8b_usb2_power_off fundtion to avoid compilation
> > error.
> >
> > drivers/phy/amlogic/phy-meson8b-usb2.c:247:3: error:
> >         implicit declaration of function 'phy_meson8b_usb2_power_off';
> you have introduced this warning in patch #4 of this series
>
>

Oops, I simply needed a forward declaration of the function to resolve
the issue.

> Best regards,
> Martin

Thanks


-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
