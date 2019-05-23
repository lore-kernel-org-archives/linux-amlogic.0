Return-Path: <SRS0=Wall=TX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B4F3C282DD
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 May 2019 16:13:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F37321773
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 May 2019 16:13:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KH4fc9KE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="JJYISij6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F37321773
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ezSQWFHpe27cRYBuWwnjzalFbc0A8+9APENgaU0O4jU=; b=KH4fc9KEYtV8Bv
	1bwekYzAfzxVtqdM2x4FKcXqB62Y65zigdSW6txHVTRG3rBh9C9FhKzafNy+VAD0SuJN2fiuHNWr8
	xVdMMzc8tUYuElbGYG0gaGirjzxM6R4DsHsfnMaq2XSojdjowUXIpDagEmRHZAMkRByaprgPa739K
	vhNh4k146zYCxBHfLfYdPiLVq4fZPkZ5Y6sg737chkrkmDeyUAwgUi5y9A08xmma62MMZ6ZgijXmG
	ousw66q9g3WrrYpvqTQJPLflqOs3y1HBLR2j09zg30dA0P1yDgopn/4SmBWcMoLlcXTKzLSZp2G1Z
	HkjEUxfNplYW972ihWxw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTqLa-0001Bp-7N; Thu, 23 May 2019 16:13:38 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTqLR-00014e-UG
 for linux-amlogic@lists.infradead.org; Thu, 23 May 2019 16:13:31 +0000
Received: by mail-pf1-x441.google.com with SMTP id v80so3513837pfa.3
 for <linux-amlogic@lists.infradead.org>; Thu, 23 May 2019 09:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=Kla6xn5Rtm/ynxCsZh/uXOzs/7PtvcUWbm78TW3QhsA=;
 b=JJYISij6OTQsMewWsc7E1+XwxCJ7YJu4Ozycyefko7cDmUqjkzF/kf6xWuFAnOuEtt
 LvswkfXUWuKGPntdlRHylbPV9y1JW5Hu0fqMzZNcnf2Oz4HfZuuweY6RZ6BnA6pS2LRQ
 Mwn12h3qCDX3PIoCuk5sWBE41AaqOiijn8jXAI7gvSJQ6cIFqLV693BJheHieGlWjvHo
 s3hqw5gZ49nccTodxDAp/AT15UCMFafqatcT58SdQDyCpqZVObvuW3h7YS1WPGYtyllc
 wsalnXQnQyPywJaKwG15xvgfqoHoD40PWsPDm8KYmKGKQ+bGe1973LFOFsYo2CyB0q/M
 H5cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=Kla6xn5Rtm/ynxCsZh/uXOzs/7PtvcUWbm78TW3QhsA=;
 b=LnaLkm1SE6vErnZdOAMdkscGgKRhJXGe7KJVgGPyiWxuSjHcYgo5FtxzbJZIRWI0a8
 roUdXK2aLsO0uQjK46iIHz9bipBuW53QjhSLJFPrt5E/faHy3yz41VoOghKcXeykJ4Nq
 Q741yWUS7eRLqCcVCgxmKS0JZTPckE/+OkUOcCFcVSAXoUHQUbMplek5UShrFZsKV5JV
 Ge56IJ/DiBflm5DsIX0lWetbdX86DdmVIWK5oz0vPTWm4ONKpOiaYinXKzPfqDpbMCHD
 91VpzV+MTw4XjfLQrmIcCPVnJUSbSBb8Fyj+mwa1Jb4qOZdBq/EGr1S0FBSo53epptu5
 0TIQ==
X-Gm-Message-State: APjAAAXGP8nwsoo49HHU2iabb+bULa2Dlr/BJH795qzVnxV/mSDuqT7N
 i5E0VGT5BYeHQ/KF9Ay86kH8AA==
X-Google-Smtp-Source: APXvYqzBDUKiUXW17Cp+BBLLt2WrMZacAsmzczuBQyg6+dOwQ2cQhPPIpTsGvSMwoBSJZaVBpKP9qQ==
X-Received: by 2002:a63:950d:: with SMTP id p13mr99087861pgd.269.1558628009001; 
 Thu, 23 May 2019 09:13:29 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:ed4f:2717:3604:bb3f])
 by smtp.googlemail.com with ESMTPSA id v39sm1383544pjb.3.2019.05.23.09.13.27
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 23 May 2019 09:13:27 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 1/3] arm64: dts: meson: g12a: add drive-strength hdmi ddc
 pins
In-Reply-To: <CAFBinCA+G6f8pq8zPwzq6rkNmyS6U=7fL5HWnObvWDWCB893iQ@mail.gmail.com>
References: <20190520134817.25435-1-narmstrong@baylibre.com>
 <20190520134817.25435-2-narmstrong@baylibre.com>
 <CAFBinCA+G6f8pq8zPwzq6rkNmyS6U=7fL5HWnObvWDWCB893iQ@mail.gmail.com>
Date: Thu, 23 May 2019 09:13:27 -0700
Message-ID: <7hk1eh409k.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190523_091330_027354_54F9A6E6 
X-CRM114-Status: UNSURE (   7.16  )
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
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> On Mon, May 20, 2019 at 3:48 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> With the default boot settings, the DDC drive strength is too weak,
>> set the driver-strengh to 4mA to avoid errors on the DDC line.
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Amlogic's vendor kernel (from buildroot-openlinux-A113-201901) does the same so:
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Queued for v5.3,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
