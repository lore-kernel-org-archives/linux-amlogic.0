Return-Path: <SRS0=5XDc=RQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D906C43381
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 Mar 2019 10:21:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2083E2087C
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 Mar 2019 10:21:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="slB5ta8+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="XskpJwos";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ALVqQgtX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2083E2087C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DkGVcrKUJM85b/O9vgMDK1a3RDhm1K8mx6ZCzyqOhnA=; b=slB5ta8+JsblS5
	n6drkXVvlJt2r+7t4te9VixPFkwQOpWs13t22rCXL4xHQuGfze1pkFFZoKA567Y0SE8yni/oOIM2x
	/WDSF5AATCdkga9rCSCDBMlxETMGU33YM8AFMKmObc7RakWzMtU+iPwyRQcsYivqXZLydxlE67JpC
	E4PheKhZn3QxR/fNwfL7Odcamz/mft1suYRxOl+0pAUWLs9/Eknc/ghr0Q9TjIHxR1nDaZVEwnDpA
	bHm3L1Fxv8pedCZ7kOCxsh6xvGlNJK/fnsyEC7HochatWuSLV15wMkxxOjcerffgYgCOH0Idcyu/B
	IJ7qsZKIhu9vv1syRDRw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h410Y-0008Fk-4v; Wed, 13 Mar 2019 10:21:10 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h40tC-0006ZZ-QS
 for linux-amlogic@bombadil.infradead.org; Wed, 13 Mar 2019 10:13:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
 Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8FaLs0MolUkifKeut3/wUXNuJGPWfQPncZ9agSOKA0Q=; b=XskpJwosFGmJBE9UoUoChX8+g
 8D8oQyAbyp1kwCPc9vsNpvKNDA8ysexVbSNcNeE2TUeo9e+r6A3yM+iffEw+OJau6am3EqSDjgY9G
 liqvafwUqTMDljMEsMEVkBBOBuoWrhHw78fSrl2BnxER78VDJDwNBoOwuUaT6fyioY93JcRMPCjIa
 38vbNbKrhGv/ItLRvBUB5E57E6DilJax0i+1LAX+MX88OAhKzKE/laFT2QVhl8Vmq0+/zFVlFTuyD
 D/A8OMXzAsgZ4oCNfSwils3xaMF5gCe70VRRoV/NNN8moCETporNHDrW5/LPzb8TWiawi5UVCjSfJ
 QGLI/WTiQ==;
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3ogi-0005vA-FQ
 for linux-amlogic@lists.infradead.org; Tue, 12 Mar 2019 21:11:54 +0000
Received: by mail-pf1-x441.google.com with SMTP id d25so2711810pfn.8
 for <linux-amlogic@lists.infradead.org>; Tue, 12 Mar 2019 14:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=8FaLs0MolUkifKeut3/wUXNuJGPWfQPncZ9agSOKA0Q=;
 b=ALVqQgtXlNZVUUqHThyPjzn0W+AoLu4mN9ZK0RH3nC0IgbYhDojpCQiqwj6B2RFYIz
 hPaUFessrqXzSI3a/zKmys36xNz6X7HvCzaTN+wEMJmsVKQRywL5CrOa+eTBVQCjJ0vZ
 nx+xKpoJvUaInFhhD0GTy+hZeyo0D3w6VtbiWbGYICyAfiuDPRajCfIBT5wUvH9dlJne
 wh7uc7iF3z/0QQzcpwegxQuXSyD7TBBM2rmFnBadhqBCgUBBh1hCKccvoZ4PQoSoo0mI
 ccR+7mLP2mICl1zZAHLDoOw3zrjtPHhY6QWeKD1rzNU7m9HNHV989aQfgLdt/STdNKlw
 iBzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=8FaLs0MolUkifKeut3/wUXNuJGPWfQPncZ9agSOKA0Q=;
 b=YF07f+vLp+OBucsp8XFwFRB9yxiTEdpp5ZhSfYDzbyQ3Dt6h9zEWvySg7k4/uj9nfx
 ttZLFiVZaxWLDlnMWDS7FY7FkZYOH6o6fxY2mWlwUL3OvvkjB5baJK0eyDfzGUr2TvI4
 TtGA2Yis5eCAayg+lVXx1wLF8bIpBT4e2eEa8ztJw7Fry2RU3vysGov8Fd00xZKz71a2
 VbnqkzE25xqk4TMQq4tknQNB0to3YK0VWL+zgwdv/L6n/uEYwEO5pYt8B6xXeCLDlT+d
 guGzbO9pPet/5oUJK6vmDYZEr6m27ugNQj9kURVSs2XId0CSxSj5FfGkJFybroZKov2I
 uGCg==
X-Gm-Message-State: APjAAAX2p0a2ogcPopmjanfhJAl3xSMjZixYhKqSpOqGmGHT2uODoOlT
 GeJmJTFC5zdtyVrIfCm0pKAjsnMyN/+Cpg==
X-Google-Smtp-Source: APXvYqyy/Qj5qoa/rx3Pq31XNygHSUvbFNRdVg+L7X7Gvvh6Vzy+u95YbPocDPi/WjrfngE/rX/5UQ==
X-Received: by 2002:a17:902:b201:: with SMTP id
 t1mr5825153plr.55.1552425089579; 
 Tue, 12 Mar 2019 14:11:29 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:1daf:3f96:9f7f:33ba])
 by smtp.googlemail.com with ESMTPSA id v8sm13118551pfm.174.2019.03.12.14.11.28
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 12 Mar 2019 14:11:29 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 6/9] arm64: dts: meson: g12a: Add UART A,
 B & C nodes and pins
In-Reply-To: <draft-7hd0mvu7pp.fsf@baylibre.com>
References: <draft-7hd0mvu7pp.fsf@baylibre.com>
Date: Tue, 12 Mar 2019 14:11:28 -0700
Message-ID: <7h8sxju7b3.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190312_211152_563201_C94441AE 
X-CRM114-Status: UNSURE (   7.91  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Kevin Hilman <khilman@baylibre.com> writes:

> Neil Armstrong <narmstrong@baylibre.com> writes:
>
>> This patch adds the 2 UART nodes in the EE power domain with the corresponding
>> pinctrl nodes.
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>
> Similar to PATCH 4/9, are you wanting to move this to the board series?

Nevermind, I misunderstood how you were splitting up the two series.  

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
