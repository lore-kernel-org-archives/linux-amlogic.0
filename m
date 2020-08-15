Return-Path: <SRS0=38m5=BZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4888C433DF
	for <linux-amlogic@archiver.kernel.org>; Sat, 15 Aug 2020 09:00:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7210C22D08
	for <linux-amlogic@archiver.kernel.org>; Sat, 15 Aug 2020 09:00:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Na5e6vGO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="i2sick42"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7210C22D08
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pk52L/6s7JuvWLa+RIN5XM1bwg03YGDkMHhHQfeREJU=; b=Na5e6vGOfvWaF6K1+QK+mHFFF
	tf2FOeCpPr8HZnm5tDQMDGK4itEnWPh847Z4QyLXZrdR+S2V6UrLh33FimXkaG5u4B5SY5DeaP7EP
	ij52DHzkmZosI3Ph/8nEgLsMNLW+Oo9zw3YcGCCCxekSzqzQ9upZ6b9QHHTr9JCtjxbYYVviza3Kv
	habyiEK7V2NWY84KDqm0jqWAI88IvZQPBTrSp7YubJS3G3TxSzAn/ydVbdAGjkmYLFZJgJCOpSntg
	l9J8nQw/jRbpisLv//Jma9rUnDO1rTYrj+cgYEjh3IDxGsHx9yNY9mENvuot1SudN6RPxZIAyBqRC
	2Dm7kOjKQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6s2y-0004Nn-Iu; Sat, 15 Aug 2020 09:00:16 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6s2w-0004NM-GV
 for linux-amlogic@lists.infradead.org; Sat, 15 Aug 2020 09:00:15 +0000
Received: by mail-ej1-x644.google.com with SMTP id f24so12355614ejx.6
 for <linux-amlogic@lists.infradead.org>; Sat, 15 Aug 2020 02:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qpm5gX5nuo7Aaqi4F3czpr69l0G//Vv2ZVAKhvtEPUA=;
 b=i2sick42PS2LD3k6tAI/LO118YCiYpKlX4JzuIlrD31uQZuZS0BESSv/+MQcqrth5S
 hQIeEc34Brdxp/M1LmL3O4pkV/yVZkLabPcX4SEe2PFyIhoC5YSOBU7UtVYpL7CC7bT4
 JJORcJwQpyIxcR7RGSN/0DBKde0+O3mOrEmjWa0w/RQLlmK+wVP86F9XueJctEo49Qny
 91Ns2xrazz9gbKDdJPlqDOwSYj0eAssEyz857V8sDAF+ViqBNT+wm95JY5CZnHmMEwA2
 kUBE1x34AszHnjBM6UpGntA2+OjE2T6GOhaNaKBs4oMl9rdnXN2zmhHk7NXw/ba0oxrD
 luBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qpm5gX5nuo7Aaqi4F3czpr69l0G//Vv2ZVAKhvtEPUA=;
 b=OvqN0tFs5QMrhA+0iRT+F6ApyEJxRdZCuUK9z7XZf7TChc0d/VIOE4oCT0F4U+LZE5
 /D1F5X31vDnZ08Oc3h2QpVchPKOP2Koq5GuWlIWaFKkhXo+V5UG7b4wqcWqoIJlBn9PB
 ZPsXSUJhl0S4ffFnL7/YXmab258BXWMKp+B3ASCeV7zhQxobKLRDP6KuylQwqXMLTrty
 SVTnCdWFFGzd/Q3dGrc4VPPvk38Qb2dRyEd6pnru/RHtlhoxI/dfjHkhdv+m3vY9izh1
 w09j7VsU1KUlsV5wLXKeR64W1UqZU/KLds/AXLW6vlP4hqLMXR4ZqjUVuP18MFC7z50D
 njCA==
X-Gm-Message-State: AOAM5338yZ0vTB0Rwcx2fA5BCSUdisHEkgNkwjvjPEhwLNNdFN6V5rVi
 vSHagVIayBaZQTjtp+fqljM/upLnels41JpuoRE=
X-Google-Smtp-Source: ABdhPJzTylVvNkBZFToVWw0tjL11SsynpW9sQy690Vi+S5grRe6WbYCE6xPJpH4obOwFIJY0JQ3Su5cQ7Figbu+Pwi8=
X-Received: by 2002:a17:906:cb91:: with SMTP id
 mf17mr6057916ejb.527.1597482009490; 
 Sat, 15 Aug 2020 02:00:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAPpJ_efVhfH-aq2NcDmK61vn7+mM_wy+nisuMg9AZhHEr=hu7A@mail.gmail.com>
In-Reply-To: <CAPpJ_efVhfH-aq2NcDmK61vn7+mM_wy+nisuMg9AZhHEr=hu7A@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 15 Aug 2020 10:59:58 +0200
Message-ID: <CAFBinCCxXd_9EL-P-aHiX+nVVkgeK7X6jOitsPWgRN6PjUUH1A@mail.gmail.com>
Subject: Re: [QUESTION] drm/meson: Hardware cursor plane for Amlogic/meson
To: Jian-Hong Pan <jian-hong@endlessm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200815_050014_618580_A7D05E23 
X-CRM114-Status: GOOD (  10.98  )
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
Cc: linux-amlogic@lists.infradead.org,
 Linux Upstreaming Team <linux@endlessm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello Jian-Hong Pan,

On Wed, Aug 5, 2020 at 9:54 AM Jian-Hong Pan <jian-hong@endlessm.com> wrote:
[...]
> We also learned there is the hardware cursor plane supported by
> Amlogic chips from the slide "Mainline Linux on AmLogic SoCs" [3]. Is
> it possible to have the hardware cursor available over the drm
> interface?
as far as I understand it is technically possible but currently not implemented.
We have a specific TODO item for this, see [0]

also I'm not sure if this is trivial to implement and whether there
are any plans to do so


Best regards,
Martin


[0] http://linux-meson.com/doku.php#todo

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
