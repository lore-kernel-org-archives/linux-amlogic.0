Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E12FCC83030
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Jul 2025 08:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1FaqgZ5A6WLz/WA6iDc1nyZDSA7NbYMeG/ngi+zGj2w=; b=E9ylkNCJUSG6eT
	VR25QtNNoNzAEcS9PCCT1Sg3/64CNnxhzDO/iQ06hqlOy360+X6w9Lz1/D9dGcO2PSrx5TZZ3f2L2
	6UarW03oDipkZbIGgHMbHU28cA+6qfq9aoREF0+ak2SBSi4wUHBOQY/ScAmYVp3f/2eDVKk0enOi3
	ZV/02JWHFhfsERhPNm6oGncafaunTc9zFK6Ob/xycYJkIBOrH2Pe0DI4P+OBuPic2pazt71Ttv3gH
	SX+r7aSbJkI7MBJ8F+OuMtMEuHKEO+5rlex13WrIWRlG1r1DOUCa/HmXakqoGd9rms+YHmz3eeM23
	9dzZh4UxRzksGZGNX1DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXFaU-0000000Aic4-0vOl;
	Thu, 03 Jul 2025 08:46:34 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXFYu-0000000AiFx-41yL
	for linux-amlogic@lists.infradead.org;
	Thu, 03 Jul 2025 08:44:58 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3a507e88b0aso4218969f8f.1
        for <linux-amlogic@lists.infradead.org>; Thu, 03 Jul 2025 01:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751532295; x=1752137095; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BCaJVrU9vvGCv3HMW8UcZSchVxJ9IX/Nuw4VRhiVqcc=;
        b=JyE0+WnwPCzJIKof7ScY+VdUJUo4GCsaOKneESTJErigtKoUKHGUqPMRU5lp/CpF5m
         xX+iAmwUkb08S1Z45VclkxrdDzHsEE+WRcK5JsiS+TWZBqf4914O5ylew4EayvTCzszS
         iSYWLzBRQnoUfAscZt4dhBYC/MngpUtK4n0JiRw7EHhZGCQWSvtOUYfDET8p5LY7QAFK
         dYMPm5LkEiFVV6CyeiaAG2ErDlbU2tYc5G89yPOkRLDIZi2Y5RsW41oGNGxK3YCKmmaI
         O3JPUKcN6byj3fW+2E5Ips4En7Jly7aBN0VIJN1DVCqAOllxknZ//Om3p1FrNCV5g8Td
         9SYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751532295; x=1752137095;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BCaJVrU9vvGCv3HMW8UcZSchVxJ9IX/Nuw4VRhiVqcc=;
        b=MPyA4mR/YiqhaNgSwKa51OVdub5TpzsKpmuZwo6iLmqAEsSWSUB9jDU1KGdtK0icDm
         uZ+KxKlDGqy/4CWpQ48atyeR5HB2ymbMal1ENKl5GtUYGw9V1K7LrJ+HG+Weem6Vd8SG
         G6a3GFb67w0tH2gh8DcZGcetR2bywiOg/mMf0pNkQvFEOXQ7nzTtxWU6tbFw0VVup5ie
         KJ/IEjkVkWb+YPpOVzsgQWpwxSR7qR4LYHArEjq+WBs7uoxAwEq/6/8Fdp7sq/CJ/gnH
         Zj2astiX7kw3DePwWtYz4VcXRY1C9wqKzsJ9iEnsfIy83/rznyMvhJdj0227DRG8s08p
         mbzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFwyKcyqD4nuAzmrvoVj7sn51R6Jm4ioqVWaPLO6MMOmT7KaSKrlwy8iT5lRSVTZnJ76DOtLUiYNR3HmdP@lists.infradead.org
X-Gm-Message-State: AOJu0YwsEWK+SoTi1KwYOylbXVsNDITBV8UYpN58MRlvoXGU/7ZkifWK
	8YAZuq1DAjGA2VCMB45Jeang8HIi+9CWhkaEk/dXLdWC5LW7ma2/Azw3oaKAZ0Gsqsg=
X-Gm-Gg: ASbGncs7xgi8mD9HtHKdpeQNheu3q3J2K4PK/YXzYOCXAUIaBzUo0wmU5l12xuTQtn8
	xPBvdjAEXQDHNjVBgqwH8G7twKiCqCIF3QLRK2xa07hIu0YIRCM2f8JJtvESZTWjGbTVfvf1Yia
	xv9x3VXoO5V+MppgRT5J5lblXlOrUGvl9eofJtM73aUT+qx+WEk9QWjyNTVNWxQVFQolmqCkC0J
	NIoDYgckS/qpjzwkGNxeMxW1pVZA8vMfgAOUR3PE3OGh/uaqnMDJfP/1d3xE0ixaXhu/zU8JOZq
	AgRsu/9eVAq+cBca5F/GZnlF8PZOR8NQcdrcswxvVpBe/uf0BXjLwNU7fMC3TA==
X-Google-Smtp-Source: AGHT+IF545q3PqJViLJ3tmQn2xNcqUD4C4aWOYfTnAGoUJX7T6e4Ign+bwQdPieifu8Yhl+1ojcvfw==
X-Received: by 2002:a5d:5e84:0:b0:3b1:3466:6734 with SMTP id ffacd0b85a97d-3b32de6b0f1mr2108930f8f.44.1751532295095;
        Thu, 03 Jul 2025 01:44:55 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1b4c:1be9:25d0:5634])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a892e5f923sm17657514f8f.89.2025.07.03.01.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 01:44:54 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 26/26] clk: amlogic: c3-peripherals: use helper for
 basic composite clocks
In-Reply-To: <27ae4f23-7a41-4810-9639-5bcc4cebc8dd@amlogic.com> (Chuan Liu's
	message of "Thu, 3 Jul 2025 15:56:25 +0800")
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
	<20250702-meson-clk-cleanup-24-v1-26-e163c9a1fc21@baylibre.com>
	<27ae4f23-7a41-4810-9639-5bcc4cebc8dd@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 03 Jul 2025 10:44:54 +0200
Message-ID: <1jzfdlbr3t.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_014457_000697_9F012D92 
X-CRM114-Status: GOOD (  12.13  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu 03 Jul 2025 at 15:56, Chuan Liu <chuan.liu@amlogic.com> wrote:


>> +static C3_COMP_SEL(hcodec_1, VDEC3_CLK_CTRL, 9, 0x7, c3_hcodec_pre_parents);
>> +static C3_COMP_DIV(hcodec_1, VDEC3_CLK_CTRL, 0, 7);
>> +static C3_COMP_GATE(hcodec_1, VDEC3_CLK_CTRL, 8);
>
>
> Note: hcodec_clk is a no-glitch clock. The current driver may fail to set
> hcodec_clk properly. A previous patch attempted to fix this by adding a
> flag,
> but was abandoned as it introduced other issues.
> (https://lore.kernel.org/all/f8c3b6e7-2f5d-493e-8254-2a27623f0d2e@amlogic.com/)
>
> This macro won't be suitable if we revisit the flag approach later.
>

But it is now. As documented in the description, the purpose of these
macro is to get the easy and repeating stuff out of the way, helping
tricky things stand out.

So when/if you fix this clock and you add tricky things, please drop the
macro then and add some comments explaining what you do and why.

>
>>
>>   static const struct clk_parent_data c3_hcodec_parents[] = {
>>          { .hw = &c3_hcodec_0.hw },
>
>
> [...]
>
>
>> --
>> 2.47.2
>>
>>
>> _______________________________________________
>> linux-amlogic mailing list
>> linux-amlogic@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-amlogic

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
