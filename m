Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54773C25B76
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jun 2024 13:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EZukbmJgcdFXssBqNJe8CM00CNcBXFdthE0QyQJjfdA=; b=Yd8RTtUa9Y+G2k
	DBXrXf3RECPYWlZmm2qR5tAhBqdQWw/Ui5666xNAIQNatsOeC96WJ3kTp9pqSr3AS7jlaIq6yQyUl
	cyz9RWx0D5tCPRF8+iA3UNY9UmjBSKBsQQwSTEqduAdMJ+9q+ZNZpT1BU2BPL/eSR+4lGQMNiOizg
	xftIyaSZPLgBMEbJhxNphAJ5749es7DybNCILaoaZ+WVffT7yNx9U2vvaxiEZKa3ydTXMEuoAuyD2
	Am29+y9mwiAmwstUgfq2V6ojffp5/7loqECuF85DvshiJDaMwrAZWR24SoDlP8weQmBW7RX5BpHw6
	ix94QPobWScR+eDiAGgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE7gr-0000000GtRe-1t3A;
	Mon, 03 Jun 2024 13:25:33 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE7gm-0000000GtNm-3YZG
	for linux-amlogic@lists.infradead.org;
	Mon, 03 Jun 2024 13:25:30 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-42139c66027so10546555e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 03 Jun 2024 06:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1717421127; x=1718025927; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=db83b7gtmge2A8js55gVAy2SLJKXwGxS2NmZR1LN6rQ=;
        b=svr1vzfS+DrQFB3AfcN7Ttr6kiM4KjvxB6kvD7/mIHxT5BJ8BAUyUNLpgWI0oSJ5gf
         dsxO1WSSrHcCe3zmASKrVG62DZKkAYFUkIzYNbHd3W505F/1/0rX0SuBfJV8W7JgRYTY
         bowJ5ZOQ9kovLBS09QIQ0u0wSpV6rOuvM0eoyAKLdmzqtmdIuIAJgD/CK9QvKfvJSsF9
         xCByjH6cBJMAYK15LiXjzMxylKUP7YPED4scsqBO/ysNSgLhT7mmLPv9br4GPbsR0qKr
         aTHIxlF09fSay4xvBN42bYEuvnAaxkO44xtyxwWX8PD8AMgEwuykltrJEvCLdN7DuvfT
         GQHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717421127; x=1718025927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=db83b7gtmge2A8js55gVAy2SLJKXwGxS2NmZR1LN6rQ=;
        b=Hzf5CvIWvL5ikxeOSpvlWclMxil5BjWMKlw2PJ1/H53PxBUSDnpdVo4ka/Pqr1V0RZ
         tYz7a96KULUMITQAxWYI4+C2sHSCdzTa6LkBMhbuUESyFuImoECc1Yl2+jy7T7pxsUzA
         cZXbP6TCkv8zUQRbrjAE7Je2g6OKTkvh4uON8noPcp6HTiYy5HNShnuTVN0S9Q+wZwnT
         9y4BXrheWuw/iYiPNsk9pA8Cfb7zdA8pd1xB+iAYo/RKN+l1apBT4Qb4qjnFSDTcAg3K
         QMjZaC0sOtOwmgjaZtdYLD2pFTQLOzCBri+2S9Be+mMCoPMpQRUm3Jum0x3NIKldksKW
         XiVw==
X-Gm-Message-State: AOJu0YxMJRpcjvaM6Cs6ptiq8Yml27zgNQgITLacotx0mYsswxwenj7y
	K38qiKqImN25rTgvEdeaIeSlVuWk2Meh/vGITgF7DAjxaU/LCWbx4kPEv5lwYHKK+a+7HNCyeLG
	0
X-Google-Smtp-Source: AGHT+IGHeaI7RxPN2zI01909WUMu7NTmnnwuif16mRfbLRfurATUUS9YSD294/SZEB/sDpFHAOOXzg==
X-Received: by 2002:a05:600c:424b:b0:421:29d7:f87 with SMTP id 5b1f17b1804b1-4212e09ba44mr67922705e9.27.1717421127539;
        Mon, 03 Jun 2024 06:25:27 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:638a:e591:7142:7b85])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4212b84de44sm117381195e9.11.2024.06.03.06.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 06:25:27 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Yu Tu <yu.tu@amlogic.com>
Subject: Re: [PATCH] clk: meson: s4: fix pwm_j_div parent clock
Date: Mon,  3 Jun 2024 15:24:46 +0200
Message-ID: <171742077913.140081.16988283160317117182.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240516071612.2978201-1-xianwei.zhao@amlogic.com>
References: <20240516071612.2978201-1-xianwei.zhao@amlogic.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_062528_938095_9CE924B3 
X-CRM114-Status: UNSURE (   4.52  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Applied to clk-meson (v6.11/drivers), thanks!

[1/1] clk: meson: s4: fix pwm_j_div parent clock
      https://github.com/BayLibre/clk-meson/commit/c591745831e7

Best regards,
--
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
