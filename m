Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 608A4EE57DF
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Sep 2023 09:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ox4kZwz8pbJH6b2db4B2cMMYgufT4YM92OMIgPb9hPg=; b=XWleUrB07Xlx5q
	oBwG8uLR0lVwUzdh9yaDPZaueyPtnPxIdwC8eAzlgzxWIGDVq2h44S+BXiBnfb7tA7W7LWzHkox68
	TKuwYwvkA3nxGbeE99kqDDbiksTnPHnTLuxML8nfPz2nUqoaR37Q5ABhBlHgJ+J7AO36QvnjjPoGs
	qY/bs2a6Uf554OkfXPyfgt7F2L8sUzEfiGuzwPZ43Tzlo6AoMj35TicTFb13/MN9tddPmYVO4v3Aw
	v1cydkiZxPNYMuxyb54Letj3GBdHvJe96pecYLBpX1DoNMt/IsPL+Ds7FGbnhQLocBz4m5Ezq2G3V
	knO7g4nWjosWzaXt97tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfdVE-0002t1-0F;
	Mon, 11 Sep 2023 09:46:44 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfdV7-0002m4-1k
	for linux-amlogic@lists.infradead.org;
	Mon, 11 Sep 2023 09:46:39 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-401187f8071so26232215e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 11 Sep 2023 02:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694425595; x=1695030395; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sQuS2BsowzkIWazbpQjvlfNfkQEbmTp9QyiIj+7bzpE=;
        b=GSrd6lTBbrwLPw2vMdToiZoicA1p+pCNbL2gIqsE0YbAAvPb5RAjJekqvbJ9frno8z
         doI6WfRBF5TJOxps1FCmRPF/28Uz4TJwvcB+qBznizuaHaMKGoretA0nCjFHtVX1L9Gq
         xI8ine4AAXXJpkK+P0eL8V2bvbhiAOaLJ3+EUSFgoqgukE3M2YiQtNM3ojNQ4UtGwWui
         VwLvooYTPZDbZ3yIarLGkEcX3cYzKqqdrLB089nTew0mi4k1OTXYy4THydPIbRc9ahAg
         JrxmgeX4vQ/lTGcjXzbWshqRr7rmeq9C6eZxsVx+43BMXjtrVFIB2MikRzfhvd21TTs5
         vkyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694425595; x=1695030395;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sQuS2BsowzkIWazbpQjvlfNfkQEbmTp9QyiIj+7bzpE=;
        b=FTfb3uYfQNrcs5/ggA6CMIXmwQBLC9xGSiEm05HlBPrbpp5sLqplqPLYWIgrzBn6U+
         kxX7Li7i+2OamvSS3VHYlVLRegyvqJucTpTZu/JIrdkMA8TVuOt4OtlI5hO9JvUVQ2rP
         +8XMNZ5QnE08YZ1tCMdirbBg8S7g4YwiXofZIPDzY+mE2u1RuNDlR/I61jCoTZFRTvF3
         doY/yk3nQqF4YlrJYLlvnqO8n0u8HsE0YNyQ63D175EeKbck/cwxxcd5rp8Y9wZ1Usxg
         8/2jNdWn5wbAXvTNHbP9XK7QwTMmAMoUDv0MMDeJVgat/krp9ArfA7oD1P7KGVhguufV
         8KXw==
X-Gm-Message-State: AOJu0YzlxpZoy7QQYpCh8O1KbVgmZgphHfEopD9UVr2J5GTw+GAcLnhq
	5bli1tEvyIFQ2DZ7SHZ0BPrFuw==
X-Google-Smtp-Source: AGHT+IE+dacoiI3EJshUztkwZYbtUVUfQH+ts8646ie2hzrqg4cqFndrT0+5nykG0OuaI8QpwY44mQ==
X-Received: by 2002:a05:600c:4f02:b0:403:aced:f7f4 with SMTP id l2-20020a05600c4f0200b00403acedf7f4mr839734wmq.12.1694425594969;
        Mon, 11 Sep 2023 02:46:34 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id d13-20020adff84d000000b00317909f9985sm9503496wrq.113.2023.09.11.02.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 02:46:34 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: oxffffaa@gmail.com, kernel@sberdevices.ru, 
 Liang Yang <liang.yang@amlogic.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20230828133647.3712644-1-avkrasnov@salutedevices.com>
References: <20230828133647.3712644-1-avkrasnov@salutedevices.com>
Subject: Re: [PATCH v1] arm64: dts: amlogic: meson-axg: Meson NAND node
Message-Id: <169442559402.3235506.17344571540273411910.b4-ty@linaro.org>
Date: Mon, 11 Sep 2023 11:46:34 +0200
MIME-Version: 1.0
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_024637_593584_56C856FE 
X-CRM114-Status: UNSURE (   9.11  )
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

Hi,

On Mon, 28 Aug 2023 16:36:47 +0300, Arseniy Krasnov wrote:
> Add description of the Meson NAND controller node.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.7/arm64-dt)

[1/1] arm64: dts: amlogic: meson-axg: Meson NAND node
      https://git.kernel.org/amlogic/c/7ca2ef33179f4e1887727c1b5fac39721db8050e

These changes has been applied on the intermediate git tree [1].

The v6.7/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
