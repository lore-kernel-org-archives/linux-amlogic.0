Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29349C433FE
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Nov 2022 08:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=79PiNtaLonlBfMq9ONNhgYbGuoaCTQDA9nt6Qawz1rc=; b=ldvmADQmCWBL7N
	ev4Kvg1R62ZHWBRv1yka3Eq/CjEmoCbBzHj6evfKLSRfUKte3yIEF3a6j2JAyDwpIKAL1ilAOCPIn
	Co+RVsdHilNm/uOw7fZ+pzkDKVjgMb/937c/F89dh1AWz1mKeCVotfJNX5vlcv0QwIG5pWksBQD5o
	rwk8Iuo41bkq5+sIb+Gkc2ouBn88JvhqXf3vULDCgCWEAPkNkVgCKdAX6Y/ntEwoIj32s6WjKREtz
	F07m5Ko3WTUrtbX0VnDwSMLeTqixj3DqDUxS7Jy+r+M81MSuJWoLmX6b3U3fm4ZPsTZCUsonOltBr
	OohZqOfWKSa50j6Ns8jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqVnI-00GkUT-8h; Thu, 03 Nov 2022 08:41:48 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqVnE-00GkRg-GL
	for linux-amlogic@lists.infradead.org; Thu, 03 Nov 2022 08:41:47 +0000
Received: by mail-wr1-x432.google.com with SMTP id l14so1573594wrw.2
        for <linux-amlogic@lists.infradead.org>; Thu, 03 Nov 2022 01:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W9DytQ1lu/QgUtGO9mzgm9cxKNspCA3RpOmraCTiE/0=;
        b=ihPXTyZfARlzx3zOeMgnhgDEhAPFQtxt1dh/8v6xYYs43Ecge13lHiGYkcUjZQKcJS
         CDeRGSDlcKyd1uI4AgO4P9gq3fZ3SNRCBMA2TZEjJCqLXcDv3MEcWmJuVrulMa6b5HEX
         lLQREkxj4BSVnbxmqIM5YHhXNpnGBG4egcSsybFwYgGBRhk+DlrVgFNqvq5gFelw5SD9
         qSkT5x7/PLTP4wbL4yQeez8JMxmUKGGMYlwV5pVthv+ut4P9xGSsBH0w+iOW887dPP7U
         vNUeeAqjOO0oBRa0HY2IYYnyPbzoJrVrNA6CAb4/6oSszx5tjSuroRv8mOQwks2K5bt3
         8wLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W9DytQ1lu/QgUtGO9mzgm9cxKNspCA3RpOmraCTiE/0=;
        b=AG7iJvVOe60XRxZ3nuL4cWxEx3F7ABrroEXyXqobLdyFJcuXGoRqGhufI/DicXyHMN
         f6cx/bwparLOWuIwl6hX/QFa2BoZYPNASwXt80N7cOatxCFsRn1tlubpSOwtSrv7OtN5
         H+U2xhibWVrQT6nmPmwWcLM681AXJbau7HK6+AAoyY7kJrWOuGDAg90DU+eFIh3Y7TX1
         TPPZwbaOwnaeZ0M2edEy6PTbaOvRBvzYjOq8nI4iNH6LBnPkczIiDRAatK3ocCSOjM+O
         BqUO46nSlq4chAAH9DIQVLRWwKItIMcXa9SMiSjf2Gw4c9bEj0DDePJFbS0jtmgidkEQ
         hTiw==
X-Gm-Message-State: ACrzQf0QNf+HhLOvjhCjLej6hL/pfLtRCpLYvFmwOvkFhBcVJNk6RRU4
	w6Hgx+qvc0pmdWwAWxrmQK5j5Q==
X-Google-Smtp-Source: AMsMyM7hD2iS4TPUK2fXFcCk74ymN/Esmn+RsmRn2QjdiPKVFaUKmnE6zQeDBpcdQb0f/AtWUQ4wSA==
X-Received: by 2002:adf:eb51:0:b0:236:cfcc:76e4 with SMTP id u17-20020adfeb51000000b00236cfcc76e4mr12571984wrn.291.1667464901174;
        Thu, 03 Nov 2022 01:41:41 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id c19-20020a05600c0a5300b003c21ba7d7d6sm504178wmq.44.2022.11.03.01.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 01:41:40 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: patches@lists.linux.dev, dri-devel@lists.freedesktop.org, Kees Cook <keescook@chromium.org>, llvm@lists.linux.dev,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, Tom Rix <trix@redhat.com>,
 Sami Tolvanen <samitolvanen@google.com>, Nick Desaulniers <ndesaulniers@google.com>
In-Reply-To: <20221102155242.1927166-1-nathan@kernel.org>
References: <20221102155242.1927166-1-nathan@kernel.org>
Subject: Re: [PATCH] drm/meson: Fix return type of meson_encoder_cvbs_mode_valid()
Message-Id: <166746490033.1047451.8509801800691914580.b4-ty@linaro.org>
Date: Thu, 03 Nov 2022 09:41:40 +0100
MIME-Version: 1.0
X-Mailer: b4 0.10.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_014144_576093_31082928 
X-CRM114-Status: UNSURE (   7.88  )
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

On Wed, 2 Nov 2022 08:52:42 -0700, Nathan Chancellor wrote:
> With clang's kernel control flow integrity (kCFI, CONFIG_CFI_CLANG),
> indirect call targets are validated against the expected function
> pointer prototype to make sure the call target is valid to help mitigate
> ROP attacks. If they are not identical, there is a failure at run time,
> which manifests as either a kernel panic or thread getting killed. A
> proposed warning in clang aims to catch these at compile time, which
> reveals:
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm/meson: Fix return type of meson_encoder_cvbs_mode_valid()
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=6c4e4d35203301906afb53c6d1e1302d4c793c05

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
