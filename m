Return-Path: <SRS0=sb2I=QW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F17F5C43381
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Feb 2019 23:02:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEA4B2192D
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Feb 2019 23:02:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rC2tJBvw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="og9vZugm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEA4B2192D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/hmll3iVY/4HjHqR++Y5UCtlfPDIhwiReBDCmuWsao4=; b=rC2tJBvwoQOgaf
	tphjRvx5oCrwAnUN3G7IDKG1rc7oMO5gMZ2EcV1Z8rDuPt9612J1M2xum4IpJvB0qirCq/GsJfb1q
	y+5S5f3csKSEQQqYOagsaMtaVKn6zSRuOQ/P2+NjBjSHqLf7bsnOzEbUAkmST9fCQiV/8qC8Lmn7K
	zLKaLxwujYeKY7xFp8bZvKO/N1tJ71TH6zQMzrECcb6dsYYnQKBN4i55OGnNwU3XTybtNUbigZAT7
	ZPbOZLcwu9ZJ+4aHx6vmOPGwLg2mP7DmWE3VHMbLTSUIsRGI6Ehaw1VCjQwfoUAaQVMppY68vaLtZ
	7sSq2WG02t9hUMi+r0Vg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gumUk-0007Vm-IC; Fri, 15 Feb 2019 23:02:10 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gumUb-0007N2-9A
 for linux-amlogic@lists.infradead.org; Fri, 15 Feb 2019 23:02:03 +0000
Received: by mail-pf1-x441.google.com with SMTP id f132so5524455pfa.6
 for <linux-amlogic@lists.infradead.org>; Fri, 15 Feb 2019 15:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=LskzHuROK1h+gyPGnPZqzE5FllwThTsMmeq6vc0//LQ=;
 b=og9vZugmjhrYTK70TlkPkVuAQYa5h3LX7Fq+EcnKu35gWDHfCHkZ/aojkvDTshNZEA
 9K8M+vIhtH8jFWmx0u61pht9F0HtpIV8LPm/diPraRFSGI5PhXr3ZLKUonbfwLJqN8dw
 216lx67v2bZ4ggR7MYRE8OMFHO7pOrrNZmIy7FXac1bfvPXTtSv3OQAEMJE1cjCPOvPg
 gDasXpfkQefbfelmizxxjBdPMsx+sHBtu2Ady9fs8tHn6vT5D/RHm4ha0Nz9ZCnbux8S
 6R0xwcYwzJGGw6ra9GeA3aGs/VL+jXxfIND74bOarHE9z59vLQpQByUkMOCvMkFUMtxJ
 sCvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=LskzHuROK1h+gyPGnPZqzE5FllwThTsMmeq6vc0//LQ=;
 b=t/6mjR3C8WUi0uR3BoZgy9n74FMthbQAQf4utBq4/MBj0Q8JuC8w98J/kgZfSt4+oh
 UOm8D8cVHEyB3cOet/aaR3AxJKT+zSzRDraG4ny2MIEOgq4uhmYSeqZDNPGAIZ9E4V3c
 PpIcemsXEb5eAd4GvYXu+hFwqKAnbw8Yp2idmNqsNvdEJpc0eDwIBUl0cYvtkuuWhS3E
 zIh+1bUy1AGtcCejZUKfYuZUsvUngmbemGlPryxi+Pl0hJiMr34JBV90FOrdNGHIJvau
 IgsAzFeSDzjzer9xpwmRyVLI0eYRjtTd1n8PJNgdoRw4ZAyJktcyFvbjnrB+ocG6YRE+
 OUsA==
X-Gm-Message-State: AHQUAuZNptII2qmh6UfaCN57DZpcKmirQ9pysB07E2qMCS2AfjwR75b0
 xk14Gdtplzcd2Z6MSoOLR0szQgjN6nw=
X-Google-Smtp-Source: AHgI3IYBoKhPT2cQE3BGmTJ89853tcuDcm+y323TWsBUgTye1X15PrrRNZ/bvAePCEWZIkAgyqx9ag==
X-Received: by 2002:a63:e84c:: with SMTP id a12mr11375134pgk.241.1550271719930; 
 Fri, 15 Feb 2019 15:01:59 -0800 (PST)
Received: from localhost ([2601:602:9200:a1a5:100f:5904:cb2b:8631])
 by smtp.googlemail.com with ESMTPSA id f13sm9093713pfa.132.2019.02.15.15.01.59
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 15 Feb 2019 15:01:59 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 0/2] ARM: dts: add the clock measurer on Meson8/Meson8b
In-Reply-To: <20190209002641.9105-1-martin.blumenstingl@googlemail.com>
References: <20190209002641.9105-1-martin.blumenstingl@googlemail.com>
Date: Fri, 15 Feb 2019 15:01:58 -0800
Message-ID: <7h4l94k655.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190215_150201_370821_1A2DF0D7 
X-CRM114-Status: UNSURE (   6.71  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> The 32-bit Amlogic Meson SoCs also have a "clock measurer", just like
> the newer 64-bit ones.
>
> Add the node of the clock measurer to meson8.dtsi and meson8b.dtsi
> so we can see the measured clock frequencies in:
> /sys/kernel/debug/meson-clk-msr/

Queued up, probably for v5.2, unless I get one more late PR in
(unlikely.)

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
