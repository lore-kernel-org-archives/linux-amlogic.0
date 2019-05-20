Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42BDCC04AAC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 21:14:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B42E216B7
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 21:14:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tT9sowWE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="rW1xFXB/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B42E216B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2XzrICP8n3ur1z4c2/N0nXODxB21irceV9wErNcV9K8=; b=tT9sowWE+dL+zy
	ZZPFxUnkmsAm44Y4hUJofSiQOHf4RdxqxkwcOTLX4VxW5UFLRMqGGjRe4SElODrL5iHTmp7LZ5AyP
	bTXO0OlfPQ8T3oNLaG5IoAcrKOFTLLZP5GRtuLUwELPnhMqfzvTbUSUgzjTR3hs3rQAYW0gw++/Di
	EraPRYyJ32A3Pbiq4E4G9JoctIh0cdf+ePlotkLbTAbEMVFBgFslOb8HfqtpGnkuV8fUPB2y5JA08
	Vya34fH3CGXOLet8+dkHaLlzikgwzo0djs/5gHYU60vg2p4+XDhqABVWBTV88gQLlK/5aXI/VY7gF
	nzllwYpksjWVUCoVTdXA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSpc7-0000hi-Ja; Mon, 20 May 2019 21:14:31 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSpc4-0000h1-L9
 for linux-amlogic@lists.infradead.org; Mon, 20 May 2019 21:14:30 +0000
Received: by mail-pl1-x644.google.com with SMTP id c5so7266458pll.11
 for <linux-amlogic@lists.infradead.org>; Mon, 20 May 2019 14:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=e9DHapnp+Qtf77YR6olJPsTc8cKNqjeLv8Q9DilZXqg=;
 b=rW1xFXB/h+J/6RxYeiTn+/Q6pKGTEUVgsyJgniYwvDoIGXrx0B91WocP0iGbPkT3CO
 SxRBw2F4+HmqMrYzKl+Q6iHvx1CgT/sl/Gw2emNF/WpioKaJFb6o2G2tVwAIMUMcPZKs
 +gesDMpmDiigfgs2Ay3imhvQBB2T3M6d3Ge+5U30mvTx07z6EaPYwYoQ55uqv0q/wVi4
 C++USRuxnvy3BhcpZSOcByFVb5CJyJeNYFLymZ5IfbTT26fmKeHv4MTX+7aJwjlqteYu
 GSyWa/dPpb7+GhrHZkvRCqFA1oJMu9ymiumxDyopFuYUQpkQLnhYVBWOP0MzQpBY2fSf
 wtXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=e9DHapnp+Qtf77YR6olJPsTc8cKNqjeLv8Q9DilZXqg=;
 b=GZ0y6AC29eCUUUiJuQ7s/pCWmrMMzBy6XM/+0uysDyRl8H+2t6TEloxYRbxYBkLF8y
 KUrnOAviFcMDhf48A5lyBuc0SsSO0Y548GXxszr/CwvQZKCzO0IVoEWDlkSdWSXmEY48
 GolK6X+9b5Tap4uUUfLkjFhY9xVkuoQGBlOXGmMA3kPP2oZfA7zoMDfSMgDY3p2m9sUq
 cma9zHqUtfaiGpJdKpAUTgrB29Xd8yHJ5DWbb29mq5DmFjvLPmDvakbO+Jla8j97WhwV
 Q5p5vNFIaELhnjUgxP0lkzQwtcbVN4/a21CEG0K6+XWIm8fXBedEqBTuewo6byUOCdWV
 /sag==
X-Gm-Message-State: APjAAAWNg/PcSA6Kw3YjDo4AP7LsFOEql2+8ZoCXUdMxxcVZgPtdtAmT
 cBKCj0VHmNTdc1hir4CrdwJoDw==
X-Google-Smtp-Source: APXvYqyHMN/K1s6B7b8p3IGNVlLCHVQU7SaaC8OyYAZAD0EsLuxuKwtszvPEIFa0iiSPXHKYTdOj5g==
X-Received: by 2002:a17:902:46a:: with SMTP id
 97mr50159186ple.66.1558386867639; 
 Mon, 20 May 2019 14:14:27 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:e483:1cc0:e2c2:140d])
 by smtp.googlemail.com with ESMTPSA id y10sm15075030pfm.68.2019.05.20.14.14.26
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 20 May 2019 14:14:26 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 0/3] arm64: dts: meson: g12a: add i2c
In-Reply-To: <20190514101237.13969-1-jbrunet@baylibre.com>
References: <20190514101237.13969-1-jbrunet@baylibre.com>
Date: Mon, 20 May 2019 14:14:25 -0700
Message-ID: <7h7eak96by.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_141428_831550_5D63889E 
X-CRM114-Status: UNSURE (   7.80  )
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

> Add the i2c controllers and pinctrl definitions to the g12a DT then
> the busses present on the u200 and sei510.
>
> Notice the use of the pinconf DT property 'drive-strength-microamp'.
> Support for this property is not yet merged in meson pinctrl driver but
> the DT part as been acked by the DT maintainer [0] so it should be safe
> to use.

Queued for v5.3,

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
