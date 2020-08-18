Return-Path: <SRS0=wsHT=B4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F09DC433E1
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Aug 2020 07:52:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16FC720738
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Aug 2020 07:52:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bAIpTEm8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gIeO4zbt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16FC720738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:References:Message-Id:Date:In-Reply-To:From:
	Subject:Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=I1YrmnaoEFILPvHBtzVdtAeL3lWVZ8Kns+ZoZCrayj0=; b=bAIpTEm8eVSzPdrUti8QjY6OX
	oU45+mDAw2grSV8jfcX0QkJx6Wjr1708gNppPE5EB+akMMX0SuEJaXVlnCVezLxS2NZJowDBm0ws4
	j9gwEGXKZWbDvuXQTZJ/8BPS3Ke6CxQw5aV4x88jobmh80tMJMzPB9yZG+tdVMQ0PhZc2sBXChO8w
	Ad4oQr+llIGbqnrUKdSR2pRBnbIZ3/SAZBcnu8kAMRZa08HiwTw15faJpJKvU9X//iPG38ZrlCFYZ
	6e894Jp8ro/vocOB5en4RFVjPyKOjdCM+mqWPbv4WR7xgthalBOAzv8gg2QsI9ntTeAHL1DUaBWRs
	DPnNHhEcg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7wPU-0000SM-9a; Tue, 18 Aug 2020 07:51:56 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7wPI-0000Kc-PT; Tue, 18 Aug 2020 07:51:48 +0000
Received: by mail-wm1-x343.google.com with SMTP id 9so15359820wmj.5;
 Tue, 18 Aug 2020 00:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=2hez8cMOHm4MHzr6nKQb7EhEiKFqllAfu4DLeZkHauM=;
 b=gIeO4zbtImu6zQZr18l+65t4Ccann9erqT18Erx9tFwDBwRM2wX9XJGk8gtrhA5Uyq
 TnU/TrxGj+A2bT0yvAtlgMR5d6qdeFpk/JhzPxH22I3IKEO3GRBS5P+c/2yHRFoA/U58
 rpuky+ij8r/M2WEV2Zahi+eY6bRhO2HMcCYQI4t56IyxM0/yYElHqeXG0pVRa/f9dRFa
 2UdrGJTSw3U4KbDAwtrS47Vz9p7HZ4pSdDEfVg8f9pDM4Vz0evb3ZPweXfNuzlj7s5Qb
 7cQhtwiQ1KaSB214sjB3yMVke86b0s7b0UW+IojE/6AEA4pciwvn4RivqoG9CerXmDL1
 n7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=2hez8cMOHm4MHzr6nKQb7EhEiKFqllAfu4DLeZkHauM=;
 b=dJVj8xXuD6/xgY/k1acRksfw6Zh7/2PyBtTTX9tv3MJI7g4rsSJMhofMn2FCT7Lfjy
 3xO6TuQCedayJ8efeJMdO7ARDfgv7Nzr1/WdZfJqjKyTD+iAJJ2urwnwkyM7zMvPSeMh
 Lrh+pLDt1j/vBuj/51F2EQbah6DTNm/hJfP7fW1WvoWiZpH8AplE8Wijihu5RxFFW+M1
 roeY57eQxBlIf9SUlTWZ+HWAtJuvuE1iXtAahGMXlEVEi9byJDOxYeB6AFDBh9Bq0kbM
 zGkjHeHG/ODiiLjqfTZmI3X1eN6war3YJ/Bh9Kwmtp4cIO2Fo4iS279abAT+ROAfN90S
 sNUg==
X-Gm-Message-State: AOAM533C+/GdreVJEhihUNcj4pakAu2Bmt2sXd/Yvy/jsvem9Vp1g8gl
 9a/+W1mD+/r/Pg9OWhSfq3AfjkF9CojHnQ==
X-Google-Smtp-Source: ABdhPJxWkppe7p4ENX4OrSeu+TJITQSE7fitTOnZmX8ICazVcUENCsw4cSRJoxRUXl1aHa5XMmsI6g==
X-Received: by 2002:a05:600c:2189:: with SMTP id
 e9mr19126215wme.171.1597737102234; 
 Tue, 18 Aug 2020 00:51:42 -0700 (PDT)
Received: from [172.16.20.20] ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id p6sm31305349wmg.0.2020.08.18.00.51.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 18 Aug 2020 00:51:41 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.15\))
Subject: Re: [PATCH v2 2/3] arm64: dts: meson-g12b-odroid-n2: Disable virtual
 RTC driver
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <1jzh6se6te.fsf@starbuckisacylon.baylibre.com>
Date: Tue, 18 Aug 2020 11:51:38 +0400
Message-Id: <6B583170-3479-4DFB-B81A-431B5982C8D6@gmail.com>
References: <20200817102122.434-1-linux.amoon@gmail.com>
 <20200817102122.434-3-linux.amoon@gmail.com>
 <1jzh6se6te.fsf@starbuckisacylon.baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: Apple Mail (2.3445.104.15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200818_035144_897792_F030864B 
X-CRM114-Status: UNSURE (   9.47  )
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Anand Moon <linux.amoon@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org



> On 18 Aug 2020, at 11:45 am, Jerome Brunet <jbrunet@baylibre.com> wrote:
> 
> 
> On Mon 17 Aug 2020 at 12:21, Anand Moon <linux.amoon@gmail.com> wrote:
> 
>> Disable virtual RTC node on Odroid N2,
>> since RTC PCF8563 support rtc wakeup.
>> 
>> [    7.171149] meson-vrtc ff8000a8.rtc: registered as rtc0
>> [    7.182875] meson-vrtc ff8000a8.rtc: setting system clock to 1970-01-01T00:00:07 UTC (7)
>> 
> 
> Maybe I'm missing something but why should disable this ?
> Can't the 2 RTCs co-exist ?

aliases {
	serial0 = &uart_AO;
	ethernet0 = &ethmac;
	rtc1 = &vrtc;
};

^ adding this alias moves vrtc to /dev/rtc1 allowing the on-board rtc to
assume /dev/rtc0 which scripts/users and HOWTO guides assume to be a
real clock device. Tested and working fine with my own experiments with
enabling rtc on a bunch of G12B/SM1 boards.

Christian
_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
