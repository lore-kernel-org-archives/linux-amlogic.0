Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22DA2C36005
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Mar 2025 15:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qbIQ1Axkckmonbz8L2vyIYXp61Q0uil7HDd3eRzs2iw=; b=ADLv2+jnrqSpGN
	xJRaMQRNYAscT1b6TaY/jZliyGANS4b6dbGwMca81bTBHc84Cv25Kl69LABnF79byJRCfSq0GUYtb
	kJJNY8qyN0Uu1bd8ZYR4rhOsHSSixMMHrkVeLukMNeq7VFJDIpZFnx7e3zBhnkBH4uHtpt8dsVA4Q
	V/8yvM+4AN/rEwhRLy0NXn9KHGsXK19rCH6O4PAablHBxB3vUzte6b/XqbrUYsZM1PgzmaAiWrF5O
	x74WO/4uFXxvswi4goU9vInPpiAla/3XIpD57gjCFZQzdIpnmi5266oOo5yZRA7Inhh4XwAn6DPol
	QB+k+Q53ObIGjop58mwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvemS-0000000FOKq-0DVW;
	Fri, 21 Mar 2025 15:59:32 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tveiL-0000000FNT8-0cuA
	for linux-amlogic@lists.infradead.org;
	Fri, 21 Mar 2025 15:55:19 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso15957795e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 21 Mar 2025 08:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1742572516; x=1743177316; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=keE5UAE8I7WQVpj+EG1JG1WPFCAgkdvUmiHSr+M5kNk=;
        b=2573rcMMptjhOI7HmbVch7XkmnMIl0kU3rY0Skc1UleL4wouh70SMO73aM00lK29c3
         HwME37iP6ECnATpGoo9NjrotgyZmvEBwMWVaWScz91zEGHf0khpRnfL+0DTCrFTLc6q2
         7sFZsC2n7UqZg6JuWAXRTX4CkQoZFTYdcNtF5lY5h4V8Pzwo0Tc/Vq9OYhrOtVJWD6ar
         wlufP9yw5/iDwWqIF2qZAnJcR7Ay+ryX63L2Px1MdKsFYmXx/WR+asGtdmn39v/uy7DQ
         H40iTVy1lhV2BPThNWclLs1Lxe7Q1wzyD3+we7pSzK2SiUXxMi2ufblFPWAgxwbGcSl/
         ImDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742572516; x=1743177316;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=keE5UAE8I7WQVpj+EG1JG1WPFCAgkdvUmiHSr+M5kNk=;
        b=mCNr7DrPc9SJ4nRm9ABxdfFeJwsYx2TDr3zTYgtK/lJ2hLN4c7YbYG4GZwrkNGPisT
         740lnhiBVDuO3RRMr1G+dLsuferhDeuDqkhzbjfARXQ2VZtkYp5ROApJsNnshJrdaGaH
         6q52YhFlisFvP54C8mJe3Gjow8+iSUfeE2uqCqESUzWZ0OE8PU8H4htIxlvYdwtAF/x5
         lh5OP/liC0HSAQ/d0PSKTMpTrKt6m6mFb/bmMBI7ZO8DQ5RLsiILxQwz2DiEqYGuDfEx
         UbsjJ8R63jjs0MK2R/ntAk50Gtd6k8hN3D1DDF03uf3nYBF9x3vzMqmNY72bAb8oRQ4t
         6r1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXe7xKUDjaLSz1awmHfMczBQEe4TUa4ZB+WhYOk1BHBeRXwsuQ2clV+j+WnflfzQOZQ0hU43w1ClS/BGg2s@lists.infradead.org
X-Gm-Message-State: AOJu0YxrjB0TbPQLF2Wej3MxaHOINkV5PwJ2HmL34plheBUl+ZBKhk96
	jVxDt+YYQbbcBH7loKlfh5MtWShDr8TKscCkGFEMFbJqCMxJeKIDtY0W7bcQbXc=
X-Gm-Gg: ASbGncuYE2rM8XJCdb4NwY2LFbHpgVIwb9LQEZ6bKXFW2u+Au+y3lEiou9pYH1HULAF
	0BIu6xtrZC3UeA2bVU/PuAvJb6l2gZ6BYNRQAiTGKq9XgNaVRHVGZRABC4rLY5LwXrEfVPrJ/zp
	fDAi5GfMUG4F/uC7hwv/F/qpbPU3kk8EdEnVQLHC0jQtgifQd1gjqzPNoCPhuDlk9lNnRRfeiJb
	tdFw2KXCIu7NJYUGl5T058UbqzK3YrT8oT8B/lGhxc0LsRmlX502oTu5aZuaNf+3pe90JbkYDJV
	SvsRYOtoMZ/+VDzTcNPMW2LMXxN9tDUeZSR7Wpim4la69nJPteuHb6I=
X-Google-Smtp-Source: AGHT+IGf7f6p3B2QWzXbSlTw1NK0pPjUROlEz/T5BuJywHA6Cp2/lY5juGyE3geEn0WI2gDMWjaauQ==
X-Received: by 2002:a05:600c:198a:b0:43c:fd27:a216 with SMTP id 5b1f17b1804b1-43d52376b88mr29455795e9.23.1742572515585;
        Fri, 21 Mar 2025 08:55:15 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:2102:ce42:30c0:9b40])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d43f3328bsm81162415e9.1.2025.03.21.08.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 08:55:15 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Michael Turquette
 <mturquette@baylibre.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] clk: amlogic: drop clk_regmap tables
In-Reply-To: <1j7c4i2xq5.fsf@starbuckisacylon.baylibre.com> (Jerome Brunet's
	message of "Fri, 21 Mar 2025 16:46:10 +0100")
References: <20241220-amlogic-clk-drop-clk-regmap-tables-v1-0-96dd657cbfbd@baylibre.com>
	<20241220-amlogic-clk-drop-clk-regmap-tables-v1-2-96dd657cbfbd@baylibre.com>
	<9f1d69ebe1ddce5dfc170e986c9213f2.sboyd@kernel.org>
	<1ja5cp8f87.fsf@starbuckisacylon.baylibre.com>
	<88fe909ab182d1f17f6ef18161c7f064.sboyd@kernel.org>
	<1jfrlwb69r.fsf@starbuckisacylon.baylibre.com>
	<ed20c67e7d1a91d7fd8b921f156f56fb.sboyd@kernel.org>
	<1jmsg2adgu.fsf@starbuckisacylon.baylibre.com>
	<697b634770d789ef8ff0e05cec9465f5.sboyd@kernel.org>
	<1j4j205ark.fsf@starbuckisacylon.baylibre.com>
	<5109de7fe1a1a8467118daf80c7b7f8a.sboyd@kernel.org>
	<1j7c4i2xq5.fsf@starbuckisacylon.baylibre.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Fri, 21 Mar 2025 16:55:14 +0100
Message-ID: <1j1puq2xb1.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_085517_198470_0B1FE9F5 
X-CRM114-Status: GOOD (  14.47  )
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

On Fri 21 Mar 2025 at 16:46, Jerome Brunet <jbrunet@baylibre.com> wrote:

>>> 
>>> I admit this is heavily inspired by how devres works :) but it does solve
>>> the early clock controller problem and does not scale with the number of
>>> clock registered.
>>> 
>>
>> I don't know if devres is a good model. It's about tracking allocations
>> and things to undo later, not really to track things to do when called
>> initially.
>
> My point was more the decoupling it allows.
> Maybe it is me being too picky, but what I'm trying to do is related to the
> clock type, so it bothers me when it scales with the number of instances
> instead of the type.
>
> More generally, something devres-like allows to register an attribute
> and link it to a group. Then the group members come and just pick what
> they need. Whatever manages the attribute does not have to track
> them. That is pretty much aligned with what I'm trying to do.

Just to be clear, this idea is meant to live in /drivers/clk/meson, for
a start a least, not as something generic.

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
