Return-Path: <SRS0=rBUq=TP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B96BEC04AB4
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 May 2019 00:24:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 839192084F
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 May 2019 00:24:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M7PaVeph";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="PetMlvwp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 839192084F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MtYHYaep+jgBJqkRLL4Vo1rYxwAo23LAoYBujF1EN1g=; b=M7PaVeph9HpA7i
	Wj28TTYGTycr8xX41rQsllnTdppeOsiTJxx3Wszz/NaeyD6Zj/+Fd4lqKd5f1QHuh/ikc7Njek8mo
	wKf1G6Jyk8Ftoc51c8a4sFo127wqanMcuCpoxYotd0JfhHs4vw2c/DOIGcrjYE6KRNCtJ5N9xG61C
	O/xfefq0tapd/djgnUYS/42KGs9pwVdkzC7pzUj46bVomIxV5IO7/TUy3rKEgz86hoSWQlf1jnoWW
	lcs7t5GFZPO3mQx5SA39foj1keGk0i4HAZhDdQI4W4YWDpnTxL8guKBhfa/PKXAM7nUqNRRJAaES+
	LFKaj2czBXNtuzIAYeBw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQhiA-0000fK-Px; Wed, 15 May 2019 00:23:58 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQhi8-0000f2-Hq
 for linux-amlogic@lists.infradead.org; Wed, 15 May 2019 00:23:57 +0000
Received: by mail-pg1-x541.google.com with SMTP id t22so374463pgi.10
 for <linux-amlogic@lists.infradead.org>; Tue, 14 May 2019 17:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=wdHUSojhWcuxM8z/4jOLd1SbHmFBMx7gtwGTAimM+xw=;
 b=PetMlvwplvZt9XhqbP1EVC/t4NW4tFZGnpR6f4xmO3APjwNOBr7IRwhHO2zXUzogKc
 DsrzEtiMeD2BO9dlHELmxuxdz1TMetbRaKuAY1gv/3DHtJvAhVQPUSHNr9yRn/DPdXxU
 C9Ld1A72ps2umwULHtHnM8mvYuC1ehSUCxVbZz0sMTTHvDwc/g1J+uAoE6NJbTTFcte+
 FywVeYiBt0N4dpLoME85x0Ii1PI2ayjNBf4u0slU1u9m4RfrYwFr3uUgGWvtw5xvKhnm
 6dQzntHqJYBbFROvCBtrtixkubohPxPkGXaD0zZPJYjNw0I4+BeB325/IxQfhEWaZ/9W
 RwSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=wdHUSojhWcuxM8z/4jOLd1SbHmFBMx7gtwGTAimM+xw=;
 b=ASARAfzAAJa6XZLVcj649S9px9NaKjIf8kXSCXf/mluzYag3leCSWXKDuqGZj6QAoi
 lnvani0odDCIAcQgWW70AOSFUsu1lqJrNf24d2drSUP4HIg1fIzbdtcnu4IZe/wFF/tv
 r2QcC56Jg6N/lhOng9YkbxsOUzkZrfT484hFPcRFmFbXeklfYXQGM6QpN3qwJcOHyJ9/
 i84qgac29rHOFiOVPvWZlX6wjt1vt+SX/Bh9xhaz7PUiPc6jL0V9AZQvb7V03siK8Sw6
 MIi1bYU9+966EuEEf+UCYsG6VMB81TooLGCQdX8tRWleH8K2aFMcOnathJd8o/aeewWQ
 JK+Q==
X-Gm-Message-State: APjAAAVaXoCu4dbBpipWduD8+zUxqrwEnxp7cL7xGzQjQav5n5G0L9tT
 NkHUSJlKTNYl8N+JlHF8oKawhA==
X-Google-Smtp-Source: APXvYqy2MGn1Ku2hW9/ADj9wkfT6F3sGWHPjub0aWtj/eqxycREWUwqdPl+DGtvldVl/FuD7c7c4+g==
X-Received: by 2002:a63:4820:: with SMTP id v32mr40593010pga.89.1557879835950; 
 Tue, 14 May 2019 17:23:55 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:fd66:a9bc:7c2c:636a])
 by smtp.googlemail.com with ESMTPSA id n35sm275804pgl.44.2019.05.14.17.23.54
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 14 May 2019 17:23:55 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 0/3] arm64: dts: meson: g12a: add mmc B and C
In-Reply-To: <20190514091611.15278-1-jbrunet@baylibre.com>
References: <20190514091611.15278-1-jbrunet@baylibre.com>
Date: Tue, 14 May 2019 17:23:54 -0700
Message-ID: <7hd0kkd0px.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190514_172356_592958_8A464091 
X-CRM114-Status: UNSURE (   8.91  )
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> This patchset adds the MMC controller B and C to the g12a SoC as well
> as the u200 and sei510 boards.
>
> MMC controller A has been left out on purpose. This controller is
> special on this SoC family and will be added later on.
>
> Notice the use of the pinconf DT property 'drive-strength-microamp'.
> Support for this property is not yet merged in meson pinctrl driver but
> the DT part as been acked by the DT maintainer [0] so it should be safe
> to use.
>
> [0]: https://lkml.kernel.org/r/20190513152451.GA25690@bogus

Queued for v5.3 with tags from Neil and Martin,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
