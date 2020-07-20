Return-Path: <SRS0=UgfX=A7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C691C433EC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Jul 2020 22:24:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12EDE22BEF
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Jul 2020 22:24:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Uuu2nJD2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="gJuwBswF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12EDE22BEF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=y7xxooIj7ds7R+OaX0oaFXBPA0qhG45p76ar9Sttg/w=; b=Uuu2nJD27SUMfMIBRDd0xC1dY
	hi4dYqf4W7ozQK9sDM3bei9AnqSsyRbiqf5FWNBzuiJVTCA7/lRFfYWFl8/+dhf5+tgu1fRhCfpmG
	pn6LGYFC0LO5czy02yKm0jOkVICd7EPR6zRcbXVtTADyB7BlWWBH0FF6PCy1IQCm/JJ8YSEt+yRo/
	cUrPLgqZdtyNFWGgekRrIc2MeStAIgJYyVd0You+EhRgE70IdrpDdRsSwpzBTVZBcDE/0k57hojVC
	VzRMTszcCh3qRZpxrjhtODwt2qiofjRZzCtQLFmDARUFh6Oa+nokyA06eg6FBxBSq+Z2qw0P7u2T6
	eiPWhsSCw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxeDI-0002k8-Kb; Mon, 20 Jul 2020 22:24:48 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxeD8-0002fy-I4
 for linux-amlogic@lists.infradead.org; Mon, 20 Jul 2020 22:24:39 +0000
Received: by mail-wm1-x341.google.com with SMTP id w3so977174wmi.4
 for <linux-amlogic@lists.infradead.org>; Mon, 20 Jul 2020 15:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=SD6pCvrvSmO2DCp4Ax7aixATHBTxpI+s2rfIo5Cd1Tk=;
 b=gJuwBswFKpnqWojomkEAyfFJ97lPplPSeCK+E363TxmVlRV58FKEyWYXj715tEfJaF
 WJp/pzSop/BTyKgsMRvZ4wcQnnV9yHjIMPlJgPRyl7r/47L7CqPAd4hc2kR/EqXNUqng
 Fzmf7psWo0I/pPWpbRBDclhg7PyIf+6bPtBHfRPDsk5o9lVCZc2+HB8j2PxdKJKcNMz1
 Y4jJwL0UGTkWerGpjrBWGt+552ScuE4A1ci+gZiZ/w+ZvEkTYLg2ef0epgkvuwpJvTMX
 s3iBRDxK4RjDsqWn+hMiv1blBBdHqVAA+JrgsOq2VlNnIAzEi0QzFzln0/8+Fc1Fj3hS
 yUug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=SD6pCvrvSmO2DCp4Ax7aixATHBTxpI+s2rfIo5Cd1Tk=;
 b=MHQUeCEUALEFB+Y7B9pbkHpknqPCfDR/TZI+SgnuS7GOP4f6kNFgbH0WXVTed0HvbM
 j8SfMuv2BLrepdVU3Man4GrzRJQc4GFsiU7TwetoISwtVvcIydebxTo6aOW30okbNuB8
 05sP3LV+P1TdbPGk7MOvBkIJNdJqz40/33PuZJ9NTvn3s+yg2ipX2ygMumlWm7/+p4Gq
 auIxVX9H9f7WrPUiLs0hkiSX0HrCPup2R8fLl+N0kAk0G8n1o8qOee0gDqAlfI3Nujo8
 KwcelzWk9Z9kmmVkQ9fGozgMgBmbXBxnNpVnq2hREXIFCb5cOB2BLSHkcbagVTYuNKJc
 PY9g==
X-Gm-Message-State: AOAM531ubSGSzj0lh0uzBJ+wvBPWSYTGJY7x2cAuxn/kEvgekUjm7Let
 /cEGCsHDUKVTgmLFKPlMFuTzsg==
X-Google-Smtp-Source: ABdhPJzLjqSEGicKLBeM9jtOFSaC7vzuE8tYOjIYpQxTfgGZI4nBdbBv1nDffuj/z+Q+IdN56GIk7A==
X-Received: by 2002:a1c:bb44:: with SMTP id l65mr1283114wmf.51.1595283877622; 
 Mon, 20 Jul 2020 15:24:37 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id v9sm36819684wri.3.2020.07.20.15.24.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 15:24:36 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: meson: fix mmc0 tuning error on Khadas VIM3
In-Reply-To: <20200718054040.3996-1-christianshewitt@gmail.com>
References: <20200718054040.3996-1-christianshewitt@gmail.com>
Date: Mon, 20 Jul 2020 15:24:34 -0700
Message-ID: <7ha6ztakpp.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_182438_666313_D6A705F2 
X-CRM114-Status: UNSURE (   8.66  )
X-CRM114-Notice: Please train this message.
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
Cc: Christian Hewitt <christianshewitt@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Christian Hewitt <christianshewitt@gmail.com> writes:

> Similar to other G12B devices using the W400 dtsi, I see reports of mmc0
> tuning errors on VIM3 after a few hours uptime:
>
> [12483.917391] mmc0: tuning execution failed: -5
> [30535.551221] mmc0: tuning execution failed: -5
> [35359.953671] mmc0: tuning execution failed: -5
> [35561.875332] mmc0: tuning execution failed: -5
> [61733.348709] mmc0: tuning execution failed: -5
>
> I do not see the same on VIM3L, so remove sd-uhs-sdr50 from the common dtsi
> to silence the error, then (re)add it to the VIM3L dts.
>
> Signed-off-by: Chrisitan Hewitt <christianshewitt@gmail.com>

Fixes?

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
