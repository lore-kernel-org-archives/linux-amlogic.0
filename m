Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D499C4829A
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Feb 2024 11:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V32Qk8Jqm4IscJrIhg/VkTS4weJwYPhex7Ae6yeBXdE=; b=Shu+DhFSqkKK+K
	4alM/R1DkXrGWJRHqOrLZTuUc+AVs+mFvrkzRyHSI9aqy62auLIlHNfVETUNt1fsQ+PG5IKplB77G
	rA4YJYfTqDc0H+ZIuBB0sUNWSNI6rB7LCydQFdhcfC78gP8SOAnIwnOFz3F0CwtZfuqghX7rxdx+L
	MFle5XL3D7OqWV8Bw4sVeohJdUxFxLsw9tAdXbPFdu5acI528D/PQIe64g6JriIFNp86Tql50Crcl
	/eeSxXYQxr5NW2GojTbKZTlzWslgx3Bnw+YVdBLRkWQV7H9QezHf0hptO1DF1ESAwBrQ1wqj1OJd+
	lZdy1ZImnCFGuUJUN2gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZrCJ-000000093ym-1p19;
	Tue, 13 Feb 2024 11:43:35 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZrCG-000000093xk-0sPW
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Feb 2024 11:43:33 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-33b2960ff60so3002901f8f.1
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Feb 2024 03:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707824610; x=1708429410; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=E9Sow8wf4cLhsoNjPkxy+Vy7mK54b8EsDuIPycqqMjY=;
        b=ITnkOsB3SRXNc1+aaR1ETwGCNxBF1wpaBxRYVMpdhsldw7421XKcwZhdmUbOW+scbM
         ZdhOqIBQFv8qqlAXVcw3e2/BTHTJbp5DaibxzmDHL/MKCKQnG0rQX3L5ZhoEFULA2FQG
         +//T/G39bBDD6x1rms48pTPPcwgs2hnish9zkQYcqQbUxzYZS0+u73L+ht344220MkHp
         h+fyDXgnqkh1OkIm1POWlCk5G7Q37od1knUTwwSmmLq7f0DAciTL8p+m4Uv+0WrpPlf4
         s52BC9F6irUtyejRWDmtkX9Fw81ZGOdnBISPou5YJuFLlvrTeDPRRLTgGrtZEY43nWMj
         OBvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707824610; x=1708429410;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E9Sow8wf4cLhsoNjPkxy+Vy7mK54b8EsDuIPycqqMjY=;
        b=Hz8rjvpDVSTGkSlyeFrS21Vqyhx/yTtgZrOitgIt3Im3DvFWZP0TvTV6QPw+l2Xvq7
         9q1V4CDJPzdbGZlHHxB5N2IOBZdkQN/LVema6yrq8xWPIs6QKu5nrISQ1NDjubdHYygL
         SLjh6vUIO9LSfeY3DmQO6Bnr09wSkPzDPzxfxrbkpl2RVRSVgG+t6CkQZ0QNJEBl+hzB
         C8VGkr8ogyGoCfTNSn7v17gWA2YE/JciaornsOB0PPoQHArvATH2vXOQ+C2LDI8JLAL0
         cGFZw4HELWAOB35sQ/xAVzJxl7ne2FsB0itzz26fA2t6K3OU5hoo9cqUZ3c0pFzvPuw7
         oMIg==
X-Forwarded-Encrypted: i=1; AJvYcCVQticddg1USmAkKmCH67LuAsAoxsof06EFhcJ0+6Nv0bSFnO5PcUTneY4bc+hBBy4A6sLbhJw1Oh3M9gl59mO0x6gaiFSZ/ArUmbwCae2BI/8=
X-Gm-Message-State: AOJu0YzGrWH1sZ+6D9ypxD0Ue9N7AjyPxLSSnKPSbQyJCUM9Re6qM/7I
	v+Nh51l19mK7PYg7B+iqH1QNoOzJiLGUvfw4KUhhwljexpitnXBVU3+KycqdZfg=
X-Google-Smtp-Source: AGHT+IG5/46zhd1eOGmh0ra4YTAm6cqkOsrOZ3nHpxyZmRoQkb4L9iG9KRCKL7XD6RvIzjKFdLIpsQ==
X-Received: by 2002:adf:e501:0:b0:33c:ddf1:4e70 with SMTP id j1-20020adfe501000000b0033cddf14e70mr954874wrm.32.1707824610355;
        Tue, 13 Feb 2024 03:43:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV7XrcP98bixIaJaWBm55q3RGYgSAE7tBhAYxKCoTsFS3k+4Ze4N9ov5S7jgh/2kJS+irBO7hxgVQEv5sDqQLLxPDbHWC/Gs9TNJlYjDEdufmt8KqWgoLUap5P3RpuWSetm000MWsh8TG+RUnCiXYaeMS5P0KNR3vebzw4AK/Q7JSo2GChThL92QnUXlhhiqm3T+6Rm3bvBKFEBzRlNWsZ+oOtKvz4oZ5nrlk648f3KJ2YpB/AX8hYJ587hDFDHo7r1dZijD51CXUPKlm5Vvhyal5Vcu8pdKF6uRZUApCiCyWoYNna6+r1jeyiDnM+GrXyNfiI2jbQ39aZMPjTPS8Zd3pV6gPE6Q7iU5e+r5dq5ve8rVNhCu75nGRzfJSoMnFhhSRik6L03/9iH7StxCOiMjhlgvJXp0QLxcfnI7mQfyKBVWxmvK2n71BqvpzozyhkCuO8AO5J3tR81TAvxXYjA7ctciW/JxNy+0RD/Pu/DIgB3TrohH6Ieb4EtEjvFx//s0BbxRWmV5YdUNG0mEtgvFkabj7dgVuJmSkIyba37uRJ9Nj4vceMwV61cZXHq4Bloh/1m9MdaDSFr4L6+ysW0lgb2UhEH255fGSjDzoKUuGFhCI24w+H3rJL0zLOVpS/KYYbMSbqL1GxJsA+mmbtlzt0e6TZAQ/d1Iwa3
Received: from localhost ([2a01:e0a:3c5:5fb1:509b:4241:48a3:e3e0])
        by smtp.gmail.com with ESMTPSA id m18-20020a5d56d2000000b0033b60bad2fcsm9261852wrw.113.2024.02.13.03.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 03:43:29 -0800 (PST)
References: <20240213101220.459641-1-arnd@kernel.org>
 <1jbk8kk5pk.fsf@starbuckisacylon.baylibre.com>
 <c61d7daf-1b13-4ff8-aeae-7dcd8dd02131@app.fastmail.com>
User-agent: mu4e 1.10.8; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Arnd Bergmann <arnd@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Mark Brown <broonie@kernel.org>, Liam
 Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Bill
 Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] ASoC: meson: add helpers for clk_disable_unprepare
Date: Tue, 13 Feb 2024 12:09:52 +0100
In-reply-to: <c61d7daf-1b13-4ff8-aeae-7dcd8dd02131@app.fastmail.com>
Message-ID: <1j7cj8k2se.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_034332_336827_E18302C6 
X-CRM114-Status: GOOD (  19.51  )
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


On Tue 13 Feb 2024 at 11:52, "Arnd Bergmann" <arnd@arndb.de> wrote:

> On Tue, Feb 13, 2024, at 11:36, Jerome Brunet wrote:
>> On Tue 13 Feb 2024 at 11:11, Arnd Bergmann <arnd@kernel.org> wrote:
>
>> This probably pre-dates the introduction of devm_clk_get_enabled()
>> It would probably be better to use that instead of duplicating helper
>> functions which do the same thing.
>
> Ah, I had not thought of that interface either, so you are probably
> right that this is the best way to do it.
> Can you send a replacement patch then and add my Reported-by?

Sure.

How may I reproduce the problem ?
Just tried with 'Debian clang version 16.0.6 (19)', no warning.

I suppose I need to add something ?

>
> I also sent the same patch for drivers/nvmem/meson-efuse.c, which
> I guess will also need the same treatment. I also checked and saw
> that all three files already had this code in linux-6.0 when
> devm_clk_get_enabled() got added.
>
>> If for any reason it is not possible, a common helper in clk.h would
>> preferable I think.
>
> I can't think of anything that prevents us from using
> devm_clk_get_enabled() here.
>
>     Arnd


-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
