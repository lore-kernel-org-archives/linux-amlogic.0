Return-Path: <SRS0=ej2R=UC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B4EAC04AB5
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jun 2019 22:13:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D312726025
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jun 2019 22:13:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="st/ZP5lx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="l1rcmfDP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D312726025
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ebcq1es+cMfMU2IEKnjB645Q7JNDjOU5Q8GboKlkqC4=; b=st/ZP5lx+G6Gwx
	C8dZ4UUFlpGv6ziq8iIXOHrgao9Q8L6zlQlcB7wzrV9s7QVljQE5QR+1Ie1MWuuAtwfvrfrilCUsP
	4n5lIpt6lUDjMvZplsWk0hAr9UiG2U8RfQ3EI6+lxF0eVk7iaNOEaB6e+ueXLchdFkn4aB/MFvX9r
	O2Hnl9kA+udzIN8cdy9BK958C6QlUtLI7p3I3mqFCPoRKu3ij8a8tEI7bfWmdF09DExf+4wNwpLo1
	XoXcO9Bh1S4wDuIr9lTME70bwqmd4uoE8udSCjF9/K1mAsxycd0JXgpM2tTGwK+V9sWxu4IM9sz12
	OqmHQ85FVSYWiX816ecQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hXvCT-0005Zu-Nh; Mon, 03 Jun 2019 22:13:05 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXvCM-0005Rn-74
 for linux-amlogic@lists.infradead.org; Mon, 03 Jun 2019 22:12:59 +0000
Received: by mail-pg1-x543.google.com with SMTP id 20so9070821pgr.4
 for <linux-amlogic@lists.infradead.org>; Mon, 03 Jun 2019 15:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=79eSeDNe0QggiFOBK9zOhkSkQmpm6VlHBwv5gxt7/p4=;
 b=l1rcmfDPB8xZh5ExX5/oeDXna+HD9CgZmCMVmFB+VvD6eo1htrqyiBs/GZ2Yfyausb
 7UVbLj/TE/avZbpLI9r93eUtQgS6YbumWYhxeushwaJj2PIlRBfC4hNhJHGM9kFkd4dW
 /R3J9reECWGS2OKGZw8sgtQ2BRut6q7/R9cIpnaH1AHx2dye3s/W2eYBpvfO0DGL5/WW
 JwYQxnz9NnbpNZcn8bWtLsSsG+0LxdDexu9oaW6sQthC9v47ZYMuFRSh01BqhHMvPpQU
 Q7H1N+qDDJ8EJyFmo++BJsWng0iPSKfXQjjZr2AqAJMQabqIklXrGc94TowDzc40eflv
 JHkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=79eSeDNe0QggiFOBK9zOhkSkQmpm6VlHBwv5gxt7/p4=;
 b=poVQoXA2iEhuC4U0l0I1zs3CB880GcxqbcrWX69wNmdZmPYosDLf1MAsnI+w38uEY6
 DS1dBgCxRScwUCDy6F2R6L7jSUel6iOsEnPgUmbn8PQ0B+tYQrQ7VWAN3u0Qz3t3kAGu
 In7R7xyqFqhSzLVWr01iECNjvrxoB7yOoUIysq3JkGZDW4yLnvkrm5gm+HndjMFxsZrc
 ebl5DWiIkHfnwdQEQ38rRB5jD2PxvajiRMAX9BFKo9DWWs0UvqUrrvHWsDOPf398kr38
 VGled7UBoE+Eg2BPJ0oahnCtuvc2bNs9MLvQ0bjAYLoKwgVFMGXwwhy+brnaOH0gNULZ
 QQvw==
X-Gm-Message-State: APjAAAUi6ZvIz2541w8PjUGzzL9RpMWOGbeTUFTggBrqagWJv+pE7LDn
 Im+o9VN98cqBvu7+r1D7IgkIbA==
X-Google-Smtp-Source: APXvYqxkGMxpvLdkckFS/GH60j+jfBPnCXI7MzEX2EcX4S0nl6IWm9JFRgyJVj/6Qy9k7P3zcGg6OQ==
X-Received: by 2002:a62:e511:: with SMTP id n17mr28496063pff.181.1559599977626; 
 Mon, 03 Jun 2019 15:12:57 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152]) by smtp.googlemail.com with ESMTPSA id
 i22sm15769445pfa.127.2019.06.03.15.12.56
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 03 Jun 2019 15:12:57 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2] arm64: dts: meson: g12a: Add hwrng node
In-Reply-To: <CAFBinCBJO3J1wG1wa6X26VT6yGT_c_1XHOPiPpMRZGW8KKxopg@mail.gmail.com>
References: <20190527125059.32010-1-narmstrong@baylibre.com>
 <CAFBinCBJO3J1wG1wa6X26VT6yGT_c_1XHOPiPpMRZGW8KKxopg@mail.gmail.com>
Date: Mon, 03 Jun 2019 15:12:56 -0700
Message-ID: <7hsgsqiahj.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190603_151258_249557_C3E8F9CD 
X-CRM114-Status: UNSURE (   7.89  )
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

> On Mon, May 27, 2019 at 2:51 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> The Amlogic G12A has the hwrng module at the end of an unknown
>> "EFUSE" bus.
>>
>> The hwrng is not enabled on the vendor G12A DTs, but is enabled on
>> next generation SM1 SoC family sharing the exact same memory mapping.
>>
>> Let's add the "EFUSE" bus and the hwrng node.
>>
>> This hwrng has been checked with the rng-tools rngtest FIPS tool :
>> rngtest: starting FIPS tests...
>> rngtest: bits received from input: 1630240032
>> rngtest: FIPS 140-2 successes: 81436
>> rngtest: FIPS 140-2 failures: 76
>> rngtest: FIPS 140-2(2001-10-10) Monobit: 10
>> rngtest: FIPS 140-2(2001-10-10) Poker: 6
>> rngtest: FIPS 140-2(2001-10-10) Runs: 26
>> rngtest: FIPS 140-2(2001-10-10) Long run: 34
>> rngtest: FIPS 140-2(2001-10-10) Continuous run: 0
>> rngtest: input channel speed: (min=3.784; avg=5687.521; max=19073.486)Mibits/s
>> rngtest: FIPS tests speed: (min=47.684; avg=52.348; max=52.835)Mibits/s
>> rngtest: Program run time: 30000987 microseconds
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Queued for v5.3,

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
