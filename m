Return-Path: <SRS0=5tHY=YK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1399ECE58E
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Oct 2019 16:35:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84C1021835
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Oct 2019 16:35:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dnlK8Rd+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="rLw/zBLG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84C1021835
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eKCdUzkaeYv4UEf8N8ckbOzEEf8HE5zSy/42mWBiQrw=; b=dnlK8Rd+yCCUg0
	XV2wYyXPOYYeBZFKx+QnZpS5Jubms7zMR/HOwPxL2g89qd4Mb1CgvJEuDWsRJwxZnYrwFA583MImj
	Ci7t747sf4IDA+3ev38CsBonMTSt7uvI3QFKKE/MgBjiCLFqsqvdpkf9v/7yWN+MJk6HJQruMaGg6
	cK6b7VsIXWa/ii4lwsw4Lw+h1KYjamO9hlz19ksfnqyFwah1X+7dwDOc0xsOjV5g2D/cleo6L7cCA
	yaPf255ESiWNcuRmbf1AQij1u8okZrVZuXjiDh76ugn6hcgMvzXshNggvaCv7EeZBNaNB7SkfsFk9
	M43h2SozWjkdLbTNp9pw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iL8kc-0002JK-Jq; Thu, 17 Oct 2019 16:35:46 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iL8ka-0002HO-0U
 for linux-amlogic@lists.infradead.org; Thu, 17 Oct 2019 16:35:45 +0000
Received: by mail-pf1-x442.google.com with SMTP id y22so2001433pfr.3
 for <linux-amlogic@lists.infradead.org>; Thu, 17 Oct 2019 09:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=n6iC9aFIm7u0dU/zNM/QcsEIHkk1HFiJjgCYQoT2Mo4=;
 b=rLw/zBLGb832jZnhC2XQDPu8GmL2TDqIyAqgKiHS1bkVHYZkpv31ojFkQe9yoiJosu
 OATsID2jjJR5fxB+f27xypsvogvi6NjOdJuEY7WyxCWVO7QiPmERQP2+3LNeZNHKeyYy
 U22+IPML7CXzC6MXwg06aYBKwbQvWV1aigUizyhhQR+EVGzHw+1AhnxJoW8lCCKcuziZ
 eCRAX7bq4dZl7sJRffrCj8kB0V6/MnbvHkNqZ1ZUfVoC4MD5M4rHy2E4APOoapoH4CAg
 2xNy2mueNekGx0CHPQDYJUVPgXpm0OnuDNHVMnK6kDtFcEwWHo03utLEe0wjkTK/Sp3/
 oztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=n6iC9aFIm7u0dU/zNM/QcsEIHkk1HFiJjgCYQoT2Mo4=;
 b=SqIrDHY+kW14woyS/BGwmgDCj1AiYvQBX/0qlUB8x7W6eJ0KlqLEdY12bFHImTgrA+
 Owd1vYja5WWI4U1aUxi0VolowH4pdVKBOgsBAX5ZayN+BQ0SZrPgd6I4wFqUGkSamY5v
 OdQBNuG1VKToLDTzi/IDcJIlvsR8KqOXL8d4F6MV8DncLo9vs7dyXC2TV0Mb2Ms94xlZ
 gvaZv4zBFBByJFOsHXTuQONge+NVyCjYK+gL7RdT4VR5H3l4JL7+4NHSrR4jaUQ8z3gA
 Nbg0VDhAJnm9hGwX9RExAF6QRGjf+bdpTcLN/ONK7DIrUCJ2jSFErp3RLygY5sHK/0JA
 anjg==
X-Gm-Message-State: APjAAAU3WbK4K7BdqXPmlGyt/M7lDNlxzbsiJeZu+eF5wgMTcexuPFVW
 fbPtHWN3GvohzQFe9uNP3cht4Q==
X-Google-Smtp-Source: APXvYqx8QHZBP4DAVpyoFFyUNQRbXJjtCE3kG8SFGsa5w0UJekNJKz/9aCD9K0RXSuH2lXuA6W7rnQ==
X-Received: by 2002:a63:82:: with SMTP id 124mr5391099pga.112.1571330142686;
 Thu, 17 Oct 2019 09:35:42 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:d8f2:392e:5b44:157d])
 by smtp.gmail.com with ESMTPSA id j10sm3548870pfn.128.2019.10.17.09.35.41
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 17 Oct 2019 09:35:41 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Guillaume La Roque <glaroque@baylibre.com>, amit.kucheria@linaro.org,
 rui.zhang@intel.com, edubezval@gmail.com, daniel.lezcano@linaro.org
Subject: Re: [PATCH v7 4/7] arm64: dts: meson: g12: Add minimal thermal zone
In-Reply-To: <7hsgnsfxpx.fsf@baylibre.com>
References: <20191004090114.30694-1-glaroque@baylibre.com>
 <20191004090114.30694-5-glaroque@baylibre.com> <7hsgnsfxpx.fsf@baylibre.com>
Date: Thu, 17 Oct 2019 09:35:41 -0700
Message-ID: <7ho8yfba8y.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191017_093544_049089_13701228 
X-CRM114-Status: UNSURE (   7.18  )
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Kevin Hilman <khilman@baylibre.com> writes:

> Guillaume La Roque <glaroque@baylibre.com> writes:
>
>> Add minimal thermal zone for two temperature sensor
>> One is located close to the DDR and the other one is
>> located close to the PLLs (between the CPU and GPU)
>
> nit: subject should be "arm64: dts: amlogic" (not meson).
>
> I fixed it up when applying,

I got it backwards, this one was right, the other ones with "amlogic"
should be "meson". I (re)fixed it in my 'v5.5/dt64' branch.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
