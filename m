Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A985C5DF97
	for <linux-amlogic@archiver.kernel.org>; Sun, 23 Aug 2026 15:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/ChISq5IsvMWT7SnaOcLE2Sie5NmL57Y2UsWqQuz0R4=; b=3+UVOLBNXD3pAydWCH5XJj2ZdT
	Kyae0/8vlBEPlrKVwkEGyePgfBBvKXh+rIInPaLJT+DPCAmKzI6xVZEOlrFYz8qsPyQJfpUmPqlY2
	O74jrGGEv+n8BHxqK3xNs3SbwV9gctoWN+oJApF6d2fl8ag73A5xBpIcW6/C8DazKzbnw/lWhJaen
	mfM70ltsW05Xzb6qTBc3aXDyBCi0L0JVaFucC/EsEnRCfg+PCMClc2CHuu6duwoOzewmHrnCvTOfL
	IbZQQ3IRH68IqAw5TTMbCjdMBy9DW6Ohz8IeqkY5fJKNiaJrdzC5D2szEktKqHqdrRR6WBpzUViKp
	ayiIfz2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyAJU-0000000FSKP-2zOE;
	Sun, 23 Aug 2026 15:40:48 +0000
Received: from mail-wr1-f52.google.com ([209.85.221.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyAJS-0000000FSJS-0XyM
	for linux-amlogic@lists.infradead.org;
	Sun, 23 Aug 2026 15:40:47 +0000
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-482c58a8683so904855f8f.0
        for <linux-amlogic@lists.infradead.org>; Sun, 23 Aug 2026 08:40:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787499644; x=1788104444;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bGssleoR8j5d5BjeV9KwAwh1Wr2o/KlpY4sV/yr+LHU=;
        b=SnDYHAEz47vbHejzLmZSYRbm0jeOIZwFvsGqa8HYDO5gsjBe3iKxK9CJ6vBl2m9tix
         CFcle3lKl50LjR1TWKyOMwX0Za/uk/YQOgBUqf1He4ey1ZJx94F96xA8yPJ0/Xmu0L/w
         dHwG0kJLF5w/he8/KRGCSUxWerWiVvNa5mYvSUlKDOPVvhsS3thmNZyPw+1tGSHb1nW9
         1RuLxKmwOxyW2/GUFSkAxjxxj8/a68lk0mnjlfuQu3G8/CRoAsL5pTe/ysx5IakcpH44
         rOem7BuwYAFEqzJqUtzd/HLiJDtCztWf7xC93YTihgRiv+3PrXMflb0YNosZMJugq9l7
         NA+A==
X-Forwarded-Encrypted: i=1; AHgh+RoY6Tkrm+BnFHPy/jjO9p7q9copD2lp+a6PH/BPmyqh7EF/ZGAolF8cTW4bSvqhrSzPcQuqeXBsTbec2EJJ@lists.infradead.org
X-Gm-Message-State: AFuF++lwj1rjuJ+6mTyKiuk82t50qzczYEDSLQZ2wQ/UYrXbOndumRCe
	S5Fj1GWf+Rv98CESDDyB7RC5G8AMIWtnd9PGsqTaeZf1OyTdCfGdZ7GPGV+uBQ==
X-Gm-Gg: AR+sD11IAnrx0sVh5yaszrT4f/GdTHiz+7WBsDkcKIbacQdoGOEgIgVuaCkwqJEtbiF
	46SrikETKz0RWMP5hp7QUiZBW5Hol0Jgvscn3ZRCa2kHviaC+NPgOWfeF6KqTPMyBI/ZsT1SdEK
	bYnMpk3jA9GQQUwwt0thyzyV6VxeDf3CtgbPfaRq73tWTtaXosXNQR6SkeH/Fikea5Q+WLwiV0i
	Tz4M8EMlFFWEBkvW3P7kKlfGRkUo4WM01ti9HrnGfFPyHGa2gLPldlh67qILGiKd9vAdi6uBkT6
	IDaJTR4qmA0HMSq8CVIg+WK6BKaBrfyhTo1GVxrzGh2MnWJMX5po4780JL3lA2A7joqqKrO4rZp
	4lJlK7AKYYMuNYgEVyahgO7+24u2Hl1G4w9HKJG1P5nGKyP6IFCx4ddJAk6mBNdMzK3V+Z+ISUE
	7w/diWngSfpbbod5Sof0/TN4PlJjPZH8JcFs73zia6TMp2nyXyRcotPndFOOFMY033B5IqTAnS4
	WUY3KW5PoyYqYsrF26sbg==
X-Received: by 2002:a05:6000:2dc9:b0:482:9a18:d753 with SMTP id ffacd0b85a97d-482c0b44acbmr22762075f8f.5.1787499643925;
        Sun, 23 Aug 2026 08:40:43 -0700 (PDT)
Received: from [192.168.1.135] ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9c0acaesm5321239f8f.29.2026.08.23.08.40.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 08:40:42 -0700 (PDT)
Message-ID: <3930906f-783b-4d72-9260-ba25cc8081cb@linux.com>
Date: Sun, 23 Aug 2026 16:40:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jian Hu <jian.hu@amlogic.com>
Cc: Brian Masney <bmasney@redhat.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
From: Lucas Tanure <tanure@linux.com>
Subject: [RFC] clk: meson: t7: Intermittent boot instability and memory
 corruption on VIM4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_084046_181676_588A383B 
X-CRM114-Status: UNSURE (   6.29  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

While testing mainline Linux on the Khadas VIM4 (Amlogic A311D2 / T7), I 
am hitting intermittent system instability, storage loss, and memory 
corruption during boot, unless I append clk_ignore_unused to the kernel 
command line.

Because the failure is intermittent, I am running 100-reboot test 
campaigns to bisect the remaining clocks and isolate which clocks are 
critical and cannot be safely disabled.

As testing takes significant time over serial console, I wanted to check 
if Amlogic or the maintainers could shed light on this:

Are there specific T7 clocks or hardware domains that must remain 
critical/protected even without an explicit in-kernel consumer?

Current clocks being disabled that don't kill the board on a test run:

[    0.380313] clk: Disabling unused clocks
[    0.380413] clk: Disabled unused clock: rtc_dualdiv
[    0.380718] clk: Disabled unused clock: rtc_duandiv_in
[    0.381377] clk: Unprepared unused clock: a73_div16
[    0.381972] clk: Unprepared unused clock: cpu_div16
[    0.382605] clk: Unprepared unused clock: f50m
[    0.383174] clk: Unprepared unused clock: fixed_pll_dco
[    0.383786] clk: Unprepared unused clock: hdmi_pll_osc
[    0.384416] clk: Unprepared unused clock: sys1_pll_osc
[    0.385056] clk: Unprepared unused clock: earc_osc
[    0.385652] clk: Unprepared unused clock: pcie_refclk_osc
[    0.386323] clk: Unprepared unused clock: eth_pll_osc
[    0.386961] clk: Unprepared unused clock: pcie_osc
[    0.387548] clk: Unprepared unused clock: mclk_pll_osc
[    0.388187] clk: Unprepared unused clock: usb_pll1_osc
[    0.388826] clk: Unprepared unused clock: usb_pll0_osc
[    0.389465] clk: Unprepared unused clock: tcon_pll_osc
[    0.390105] clk: Unprepared unused clock: top_pll_osc
[    0.390738] clk: Unprepared unused clock: aud_pll_osc
[    0.391361] clk: Unprepared unused clock: ddr_pll_osc

I am not forcing any clock to be disabled; I am forcing all clocks to 
stay on and letting them be disabled if unused one by one.

Any guidance or hints on required platform clocks would be greatly 
appreciated.

Thanks,
Lucas Tanure

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
