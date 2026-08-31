Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71529C61DD3
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Aug 2026 09:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QgTJBdItQLYezTTcKV4IenV5Bte49sD50TNghK+XEu4=; b=S+MZJwVpXQNR6i
	nRsK0gf2v6d5mayyIqKw5W0BWkpao3EQj4LoPCOJxdfgg1+NxpS0Gc+ocjjC1X3eSx+MbJ8ANJPzi
	MbbiZmVkVr/219cPCcHlEnlvaYo39sBwhg/X1ZRK98xeazAkqxkUVmvgmJN86FjD2Mxhjq5IhmSHE
	1vsYiWZaBcQXjmCQMSi+4+PcEn9EiWOZesMC7DF+oLajYGpMAz77NV2tH3shH/DYnetTJn4QuyTiK
	JGugkjqcklWnDp55x0i1NHdsGp/PaTCscnPPVhgM9xbb8D3UvbH4BMqOOE0eCtoaaXAIBY65v/0Ki
	GmvgWb53gbzqX08wdgqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0yZz-000000092q8-3jMN;
	Mon, 31 Aug 2026 09:45:28 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0yZx-000000092oq-1bK5
	for linux-amlogic@lists.infradead.org;
	Mon, 31 Aug 2026 09:45:27 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-49b8eeb3ff2so23830615e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 31 Aug 2026 02:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788169523; x=1788774323; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1adx4Gc+EAGVyQph6bJvgo9B2nQWzOo5SA1jOlLp1vM=;
        b=P1+Ajs4nYPWsFVlU3/dJILtiu8CGNhbFEYSdej3OBEOF9n3QZlttHtTfocvQHbfbva
         F6qqq43jXPDrhHayodlntaUu4LzPC0Yf11KYlbU6fwHpPwDFRb2QbP4MJazwZVQu9wmB
         r6VbL1l7MxH0MX63uTiwKE9cdQUoCzUvasaj64LLsj3nzg8nn/63NZVga03KoDPGRhBH
         i6punNxm4dMUTTqdD1r2EArDhNzSyfV/LUWaMJluKLjkE6LeblrSTIn9KM0crBnOULgg
         f6pNsD88+hAUo4oU5x3mSwgjqK9PWnzpKJZGYqdA7Jx0N0Lc8xFv+QmwXHkeeLCgRQKW
         JCHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788169523; x=1788774323;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1adx4Gc+EAGVyQph6bJvgo9B2nQWzOo5SA1jOlLp1vM=;
        b=r7UCWf3FvhP0Sc/O4Gy0kor1QED2TkEL6cAD6gfjvh9g4XhNq58KgKDa99EaczWEBx
         fxEorDBAZ1v8vn2bd8T0PT5rHJ4s1Qt/pidXNDVTMhqwm66KA7KdVfCd/RglFZOJiZXV
         lY3wXLiVIbMlBB/Gt1YryNy9rzkgqR5zWbE8arFHg5h9PG4MkRMzTkn3u5Z7pn5s5bRC
         s0qTNmsX4DfSG9u5+a/nzLGxJ+t4zt7bo2TuCzncFvwN3pRuoQ5iateY0uopBGeR2HGE
         5TunF1wZ9iGdFSQeA24hgca87phOlkFijAvGn7PK/4fD/BzHAxTDSF964Cq/ZMinSkZ5
         LHLg==
X-Forwarded-Encrypted: i=1; AHgh+RrT5wIc8bo440bf9V9YVw+sXWdM4FRll9QjvvDLG3mzGYqidVnFpbuayeCXFIEcd1NZRjpb3EnO1izJLQFj@lists.infradead.org
X-Gm-Message-State: AFuF++kykD6BwNg6yyYwRx89zaxAAYz+S+hfBm3t6Zx1lRyDbJiS1D25
	X19FK9prLGYWyIMZ324pjwgYRWGgheMlFPKUg48JqPQdbUn44nKTbY5xImwKUtKhHwE=
X-Gm-Gg: AR+sD10Y3DtKnptA2qB2isqtIJJprnXUwgJArq/Y9AhxcMBeVFqnYoMgWDsUtKo92Ys
	QvrdEkO1EbuTUlzcUo8Qz/7+OdoF2TjFZ4Bi6x3HbojrG031VWD4c8g56Eu8RnrhDe9kOVFhBxE
	Z7OTVY6HUSYraCMLR7pZpJeA6nzEbgx3ISq8xcFED6mVGBspS+EzK4E3i+PuvI/WZJOnkwP7t50
	M+oaa2wHKefqcyyazziZprpw1lyzLAoYiHZMhb9IQMp9nlxkMc2Zc6ZqXoaNm5y3DliX2l01fMb
	yOHb7eeqPk0UdrBhF+iErNFC+ILJkoizPsP+WxbkIPE3aehxdPBzL+SbhBhShLnBAt+0VgoQLND
	knNUMuy1RaX0muXQvRJLNCkBdLygngy1wRqxDm6O2MzgZzc+C8bT4uRAYWxVVnrN7BNahRadZPU
	wT2DHCNOo8W2Z443YF++AlM1uk9RGXUt9dEwFrVfX/A1MNTz0OEFRrdTfQ6g==
X-Received: by 2002:a05:600c:1d08:b0:499:bf0e:95c8 with SMTP id 5b1f17b1804b1-49b91c2e145mr374445115e9.1.1788169523048;
        Mon, 31 Aug 2026 02:45:23 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:a65d:30ba:195:2a4c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48436e2af45sm12860834f8f.9.2026.08.31.02.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 02:45:22 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Lucas Tanure <tanure@linux.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Jian Hu <jian.hu@amlogic.com>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	Brian Masney <bmasney@redhat.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: (subset) [PATCH 0/4] arm64: amlogic: t7: describe the VIM4 supplies and keep the fabric clocks running
Date: Mon, 31 Aug 2026 11:45:15 +0200
Message-ID: <178816849353.1471657.3294500872963560105.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260829094758.23248-1-tanure@linux.com>
References: <20260829094758.23248-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_024525_731760_34C1AF75 
X-CRM114-Status: UNSURE (   5.26  )
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

Applied to clk-meson (clk-meson-next), thanks!

[1/4] clk: meson: t7: keep the memory fabric clocks running
      https://github.com/BayLibre/clk-meson/commit/43e1705ecab9

Best regards,
--
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
