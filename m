Return-Path: <SRS0=EYbA=WB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2490EC433FF
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Aug 2019 21:17:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E91192147A
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Aug 2019 21:17:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dFkH26jj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="I5W//gcU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E91192147A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jbblll7zO1D8djL1Do8krnTulm2VTBJ4BeHLiix3QA0=; b=dFkH26jjOTkKzW
	FoEyllYV5mlPDAQD6C/qhYILVjCvAeJNJTQkCk/OHNu1wMQrXj7rbynLQpy7VmzBYPtv44sUZjfzQ
	5JDtT50uqdok/gVLYHPYNHneJ6fwdz+PD3tJc71YMdatSwX6WjW3C34AYX2BK38JALO5y+cvkJQd9
	nIabynUN7iZxq+Tlo9/qOeyRTpm8KouwAzEWs+vJx3H6ccgS1yWkAWNdjOwTsz8H9epDImyxRc9al
	gCl5eE9OVC67vnHijtodixsi/HLuWRUHG6u0bGhC5blX1IlHs7HTSC5cP3fYyxHdkxKiZ0XRsoz3N
	LZxoAm/SHpzDn/GEYG5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hukLe-0003Ea-NZ; Mon, 05 Aug 2019 21:16:54 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hukLb-0003DW-Ff
 for linux-amlogic@lists.infradead.org; Mon, 05 Aug 2019 21:16:53 +0000
Received: by mail-pf1-x442.google.com with SMTP id g2so40269894pfq.0
 for <linux-amlogic@lists.infradead.org>; Mon, 05 Aug 2019 14:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=Hjv4j/Vj9Xr1+lu3Alv0JlnmOoEgFtBXSbU9UmsCNGo=;
 b=I5W//gcUzJjBl1Uh/hM6NCnd/3gkKL5WdQwBH2HCxYB93LCDcBaq6915n5HTBbwLzl
 BIwoT8Pr5Uc8vdAH+4NtY+xzjflTxDsc2Td574oTXofj1JvaQmLEV3LCVj5RSE8Pzlhc
 EcpADse3wb4aKlMimttC306Fchd3kK4tcvLifCfNb4+V/xpmHsh/VVOEdc/YH4ZepUtg
 +kfLFW4L5jADtwfGi9mrxLK7YHVLoP1/UAxkigc8MCywrRI9cv+geqfpQ3Sv/tfe1osq
 5ee0Z3BBLVSAUIW8YD/aW9IuwcTu1hWuL1be/vg+stx4M2Bg4fkd1qcrayV/mYtR6MeR
 dlng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=Hjv4j/Vj9Xr1+lu3Alv0JlnmOoEgFtBXSbU9UmsCNGo=;
 b=QnWy8p+maawh7X17PdBULOGQH6nSUgSXr2dK3jWikn2AzkiDeKzgAkiD2LYQNTTf2R
 ShnjqUbeNVFD6M44ZLIt3lt+wLffpOxzb4ySTf0qHQZFI2D0jkDU8jdLvHBgZGajyRpv
 cK4QwRySiJU8E/FaaW5kqAiXMuffiuWAQwpTh0mmXCsvLfSF+lm8CwWth5Wt2lQleLyB
 nHk4mpdokRD5Ov0xYAjTdJluDir3LDtOwzNXfhSKnqg1qXshZcNiD3864yT4ivnOJonI
 bpJ56jCnDaibp7oNbx0QJAHXE/5NI14x9AU5kBcicikZKz62bRyFl2ga9fyEMH/07tXs
 aaig==
X-Gm-Message-State: APjAAAWHeIYb21b39CrEKjDjmYIdGhR/bVShCzjcngv0aKeGxg0QYK5K
 cURo6jyRdABqbJyEOP+NITQOAcWZqM1f8Q==
X-Google-Smtp-Source: APXvYqxahduyCEutbqa0LcJHp5B6a1S9MrYHMRKY6K3RuFuNrWxNYoi+A5H3XEU1nhAc3ORA/+GmRQ==
X-Received: by 2002:a63:5402:: with SMTP id i2mr111205104pgb.414.1565039810266; 
 Mon, 05 Aug 2019 14:16:50 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:7483:80d6:7f67:2672])
 by smtp.googlemail.com with ESMTPSA id h12sm21316957pje.12.2019.08.05.14.16.49
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 05 Aug 2019 14:16:49 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v2 0/4] ARM: dts: meson8b: add VDDEE / mali-supply
In-Reply-To: <20190727121257.18017-1-martin.blumenstingl@googlemail.com>
References: <20190727121257.18017-1-martin.blumenstingl@googlemail.com>
Date: Mon, 05 Aug 2019 14:16:48 -0700
Message-ID: <7ho913gvnj.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190805_141651_519693_B5BF6A34 
X-CRM114-Status: UNSURE (   8.34  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> EC-100 and Odroid-C1 use a "copy" of the VCCK regulator as "VDDEE"
> regulator. VDDEE supplies the Mali GPU and various other bits within
> the SoC.
>
> The VDDEE regulator is not exclusive to the Mali GPU so it must not
> change it's voltage. The GPU OPP table has a fixed voltage for all
> frequencies of 1.10V. This matches with what u-boot sets on my EC-100
> and Odroid-C1.

Series queued for v5.4,

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
