Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE89E92FEC
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Oct 2023 06:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m++CWJS8FpmTZD30Wi+AWRbZkBJ8vLY6U8jsOGiRzz0=; b=J7hPK7tbMcBkDh
	HeWcpMyyKFUxniEr911Qtf9OWhTch2pG5svHd5LTabeHtR/8af6mj26VjUUJt7AqmrezBk6pvGCZC
	69ZDI6HIq9edVi/NPgg4ElgAWuwi8Dgelk+x+T0Pz89D2yLar34/kRzhtp48a66DjlTdlOpNm17DL
	I1l4VzU/ZzY5Zv23H/sI3mhPhth91W5m6SO/3lNXiuA6ReetOYXVD8kELn7mvUVcTc1HZsRY6R8E9
	5cX2ijZiOSNtBU/zIclHgfZeVgOGoKnYSVkFxFp9AypwOXKYjR67hpO6WiCxjmoU26gTVG/W9fPcx
	GUbxXVkb0pdtOe9t8ePw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoeYa-0055lP-2G;
	Fri, 06 Oct 2023 06:43:28 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoeYW-0055jX-30
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Oct 2023 06:43:26 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40684f53d11so17222355e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 05 Oct 2023 23:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696574603; x=1697179403; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CHU0p37PqytyDnl9AN/GlxDTVLGaz1pQ2WVuhuaUWKs=;
        b=GbykYimjNeDPFGGbcOroOXWtZOeQ9/ciDlV5P/sBWJOFTNTMziClnc47TFgtEnnoHK
         BvVzfuEsHn3jO4r+Z2jOKGIJeZrdyixKzgzvbaW7lP9YJX1zgI43tyIZibqhTNj+xMVz
         sm5rSyAfOpreHxfgDXMAJ80fEp92uwn5cveq/103drM5OH6rvbNsVNPr3QSYwC6BZ0Dk
         QO1KrXnuo7jZDK99jj7+gqds02mpyfjUz8DaAyXxdPBZPaUDwAcz8HqKWreSB2TKzj1h
         0moLcyjhMFqqYpW4VvdogtHD7Cpb9JL7coRp18TEiA7QgzDBCll9bh/A3ncKXjfrVP0+
         Q6pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696574603; x=1697179403;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CHU0p37PqytyDnl9AN/GlxDTVLGaz1pQ2WVuhuaUWKs=;
        b=XoL07fwevon3jhGNjxkULwgGFPr+NqCHgS+JHeRdg4pz7UBhNPXffoWyXt/5mO+Ti5
         WHUcMD8u6g3e2S6zyLizW0mDOHh6IBBUhTMCzY2ZnE255gEfYxDXj57qmOMNf8BlRt72
         gcRMkBOZkZlApJzxFgG3q87hUm52QskXzzkglFB9X9w4Db4K7cqCuO3LCadNy9wcKXJz
         uRl9NnxPZrWclfmyxUMoRSP5t3bydOGekfizlkxaqg4t3sCaAYLKE42WwKKEi7np0FSL
         xl/NOPWTzDB2/Jz5lBJWqe//IdcN0TglykSqogEY8nINFFkWyV6jMXl51G/TKnyv4arU
         KUEA==
X-Gm-Message-State: AOJu0YzdhJmquDYct6QbyNqUGb5xuebrjLiefw+3vFp/Rq/TRfGY7lS2
	gZm3IGxy4hJMyiVpGQvTbQv7sg==
X-Google-Smtp-Source: AGHT+IGFjacFMG9oC4/CF6EjUVpWFzI0wzWd107RtpaewVuO/PTRmrBZuqIV61r7/hB5J8ky7lhDzQ==
X-Received: by 2002:a1c:ed17:0:b0:406:7d74:a29e with SMTP id l23-20020a1ced17000000b004067d74a29emr6809182wmh.19.1696574602628;
        Thu, 05 Oct 2023 23:43:22 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id y24-20020a7bcd98000000b004064741f855sm3002073wmj.47.2023.10.05.23.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 23:43:22 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Igor Prusov <ivprusov@salutedevices.com>
Cc: prusovigor@gmail.com, kernel@sberdevices.ru, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20231005195543.380273-1-ivprusov@salutedevices.com>
References: <20231005195543.380273-1-ivprusov@salutedevices.com>
Subject: Re: [PATCH v1 0/2] arm64: dts: meson-a1-ad402: Add SPIFC pins
Message-Id: <169657460179.2128575.1714588194034072969.b4-ty@linaro.org>
Date: Fri, 06 Oct 2023 08:43:21 +0200
MIME-Version: 1.0
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231005_234324_969434_4FEE1D1B 
X-CRM114-Status: GOOD (  10.11  )
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

On Thu, 05 Oct 2023 22:55:41 +0300, Igor Prusov wrote:
> This series adds SPIFC pins description to A1 pinctrl node and selects
> them in AD402's SPIFC node to make sure that muxed GPIO is properly
> configured.
> 
> Igor Prusov (2):
>   arm64: dts: meson: a1: Add SPIFC mux pins
>   arm64: dts: meson-a1-ad402: set SPIFC pins
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.7/arm64-dt)

[1/2] arm64: dts: meson: a1: Add SPIFC mux pins
      https://git.kernel.org/amlogic/c/4985d0b308eeec44d2563d7c9d4884bc382d01de
[2/2] arm64: dts: meson-a1-ad402: set SPIFC pins
      https://git.kernel.org/amlogic/c/b50944fe2234a175ace253ed05dfae10caa49566

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
