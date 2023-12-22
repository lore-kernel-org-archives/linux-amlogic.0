Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D9DC41535
	for <linux-amlogic@archiver.kernel.org>; Fri, 22 Dec 2023 10:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xEf6zFn8kwaQkD6Ec9jxKnu3RxQt4l4KJXr+/A//esw=; b=BcCQGeGPwbd85G
	Cdwwj9cnCZ2rUF/UckeLWj0G980K/mElshenEpUdtw1UBt0OTkuV3wWgyJT3gNff4d9vf7R5NBwch
	XlZeS1yKkp+3eWGYG8pAlIJBNHN4dxILsRUTY2JajzfsNT1EMC5QaEidTeABtMZqi/dozkIjvUSjX
	XZ1LBNf7/VeOzYn2A00G5K5yjZBwajK+Er77SmjEnhQIxbzPVwurM7GTlD20O03JQP7XEQvw3gnvK
	/L7uYQIAwJ9PCpuibwgBOAQj4IQg3GlvK4CXizaj7B1hVzx5oOjHORiYFnySuOA+tB5YkuCyj8xfX
	xdFgPZnMzLc3MERj7IWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGd53-005ab7-13;
	Fri, 22 Dec 2023 10:48:37 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGd4z-005aZv-1p
	for linux-amlogic@lists.infradead.org;
	Fri, 22 Dec 2023 10:48:36 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3368fe4dcb1so590956f8f.1
        for <linux-amlogic@lists.infradead.org>; Fri, 22 Dec 2023 02:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1703242110; x=1703846910; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:user-agent:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+GWXCTtjSNNR9oPq2iw0nf47LFIhwakJPmZPJ2MyFfU=;
        b=e2XmsmhRVba++gmq8WvlF9axBOqpE69xgEl5af3z8oNR9TEYt9aC80UWakY71cC80P
         +G87MWEJhHF93Cfn6PwyKIxpfdUWmkTZt9alo50P8B1C0MQVzvS8cLexvtrpOleAgqeJ
         H8Cp9D6c9xNW3VXBXv26ncnW7LN9WSRoSJp5YmBjkBqoU/QrMzwceg43EuKEFI734538
         6kX9V+5tZ8mpobivUzKtoSMXh0LeKTXAWG7Zyfyw9bltWX44LsqJpNX3TzuMtDDkgIwl
         VyrUb9QzLLFyYzAC1YRjiRCKkLru93X/ow/UmgH3WBJdnZqwUQaB9fHcPsbjOhTm9AEx
         ZEGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703242110; x=1703846910;
        h=mime-version:message-id:date:subject:cc:to:from:user-agent
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+GWXCTtjSNNR9oPq2iw0nf47LFIhwakJPmZPJ2MyFfU=;
        b=X2LB4rcS0MbrG1q/Ib5z6TmAQGNB6o/bnwN+XedhxYvHmKK/xuJTrQveYBTwSmFRpn
         yUhPKJ2JHgGLQsJWS0fncWgWUeJBx+ZcjKbPI6M1U4OjhF80ZFpCYgcK3J9FZyBc5eXX
         2+Ck6e8DaddcDWAe4JTeSHCStkzXO03mSogz4rrRTnh55c7rUHgBQN3BiP5OKmZaFqF2
         w3mFZvby0yVJ7Xiu6rY/gO+NmpsOKNEz0ybnAGg9nHSOvSAr3tRdErUbznwsBKA31043
         3t21hE8v1Wr9WE+OwSjeLCxEr1ffXrbaUhbxk0Tms7EqQqZr7aQBQjrUBKT1u1LcjlTC
         mXYQ==
X-Gm-Message-State: AOJu0Yxu1isedT9tBjDM02PhFaCxJbs6d1vozVSinlO/LipTwrgDA/OL
	guXfyvYIorZsj0ZpUroSRJabr06JfeC8eA==
X-Google-Smtp-Source: AGHT+IGpgKGlsu3/wK0e2gT8HUtM9465RlPHpE7S5sqn7igaY/OJ9/MGNXGVgdBk1vdggoRNKVwkTQ==
X-Received: by 2002:a5d:40cb:0:b0:336:7655:c63f with SMTP id b11-20020a5d40cb000000b003367655c63fmr581406wrq.47.1703242109957;
        Fri, 22 Dec 2023 02:48:29 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:c099:e596:3179:b0fa])
        by smtp.gmail.com with ESMTPSA id h16-20020a056000001000b003365c83273csm3992142wrx.16.2023.12.22.02.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 02:48:29 -0800 (PST)
User-agent: mu4e 1.10.8; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, linux-clk@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Subject: [GIT PULL] clk: meson: amlogic clock updates for v6.8
Date: Fri, 22 Dec 2023 11:41:11 +0100
Message-ID: <1jzfy28qdf.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_024833_796558_A3357D9A 
X-CRM114-Status: UNSURE (   6.31  )
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


Hi Stephen,

Here are the amlogic clock updates for v6.8.
It adds few new clocks on the g12 SoC family, for DSI, CSI and the ISP.

Cheers
Jerome

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  https://github.com/BayLibre/clk-meson.git tags/clk-meson-v6.8-1

for you to fetch changes up to 5205628ab0bfe64952974d476ee001f6c7e0ef7f:

  clk: meson: g12a: add CSI & ISP gates clocks (2023-11-24 18:08:48 +0100)

----------------------------------------------------------------
Amlogic clock updates for v6.8

* Add DSI clocks on g12/sm1
* Add CSI and ISP clocks on g12/sm1

----------------------------------------------------------------
Jerome Brunet (1):
      Merge branch 'v6.8/dt-bindings' into v6.8/drivers

Neil Armstrong (5):
      dt-bindings: clk: g12a-clkc: add CTS_ENCL clock ids
      clk: meson: g12a: add CTS_ENCL & CTS_ENCL_SEL clocks
      dt-bindings: clock: g12a-clkc: add MIPI ISP & CSI PHY clock ids
      clk: meson: g12a: add MIPI ISP clocks
      clk: meson: g12a: add CSI & ISP gates clocks

 drivers/clk/meson/g12a.c              | 115 ++++++++++++++++++++++++++++++++++
 drivers/clk/meson/g12a.h              |   1 +
 include/dt-bindings/clock/g12a-clkc.h |   8 +++
 3 files changed, 124 insertions(+)


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
