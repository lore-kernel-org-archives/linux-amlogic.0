Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED52C48260
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Feb 2024 08:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xmLtktahw4oFa7PQbIlEdWzG5xTdaiJzzqmYee818oU=; b=HJ77meDOPCswMz
	ngvnWoRqiPIJqZPUWCHgfSTWhPaYJNJSidwRp1Pc+nPn+XB/MMY56LpVUwyC68pWOGqg9i1enAUDi
	pFeYryC+0PVw7+lJtL6FEFNcxhmUVBr9b0QSo8SUbYZ3l21sGtrhaMFG0nPUpXfr+hKh/s0hHy+iX
	EnnxAgoyZ4rJLEYe8+Vi2ApxoasHMJOwlcC7OtqrOe0ElmVlD5woBK8Ee/XXZ+t0oOZV1vR9gufYX
	2KcfKjVVPKNHBgw3oSkI9dAylH3VDK+ipnfr/c5qfCyF9Q6JZqHz4SvliK/IeJd7J3t4TXT8iXksE
	ZFkjlfMZJ+zOrrVbbx0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbzQ5-00000009gXy-0SkH;
	Mon, 19 Feb 2024 08:54:37 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbzQ1-00000009gVr-2X28
	for linux-amlogic@lists.infradead.org;
	Mon, 19 Feb 2024 08:54:35 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-512bde3d197so76332e87.0
        for <linux-amlogic@lists.infradead.org>; Mon, 19 Feb 2024 00:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708332872; x=1708937672; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Nbg2AjR83BKRqP6eesz1VFg3OuGIvtb3xMqeLGeGpU=;
        b=R4ZRG0cX8xJdJCEyu79DJMljc+P0FjvOgTeNI5ip7VWmjUiltYS5hx5r1lskyxzAXt
         EYlIHGd1p1JwQwtxyTN9hMziFVVecDU88a05KwINtyMGZ2Wm+yfVW0hU+WOY+4iRswll
         bDb+L0b1BvBc8pyhfHKgu73wThqihbq6ALBaz17/fmuwf+ZmppIjiDEJ7i7mrdw8az/M
         BOwRd7WTyg5U/gJThPVZvmp7fbmz8MSQlcdLPN/H83+5SRXgQTWFbK+xMD5kbU0u6lOy
         HkpjPVu4CsiIvF6hoIcM/8ExYSjgaIu/cTV4JuCRSwfZpf6w+wlQPmBdNCpDFvTSbGBN
         0bjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708332872; x=1708937672;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Nbg2AjR83BKRqP6eesz1VFg3OuGIvtb3xMqeLGeGpU=;
        b=WGyAegpv0k1vcSSs8GTObA76R4E5y7NiGFy1PIln2pFhqxA0iik3VNNlEllgo3g8Ug
         jZPFhvzH9xVUJrKT/KvBHOTP3GBcnr/FcfNU+IhXZI8BUZ5I3h9YP+aVbl51agNQ1476
         W4x5AElisUcMqQ+XXgw2wIfGiCEzKil6CWSOP8lLf2WXzB5Kyb6x/EgKyMls4feGqkf2
         x7cVGAq/PvXfOGoWlSr5itALFynQqyK3cD150fBwc8dFMpC4URX2Te5oYAtPsyY8srhV
         WLHygHsw7vQ4KVhVsoqMi0AU1n1jtmOpeoD4RrO3IUXMqZt+NdmI/Yspz+r1WyYrO1UE
         kgNg==
X-Forwarded-Encrypted: i=1; AJvYcCWGR9RA2n1DBj2KuQawLFP64UdxcoJPbGk5b7SjwU2gko9RIdnwBENaW0evWMLvneWJMyMVwqZ4TVBTu8pTde29hiJ+Pti2sFHd7pSB6XaLNJk=
X-Gm-Message-State: AOJu0YzvJoqNNpYGaBjrWEB3scoaOHghO70dNXQ7GpMsumervfzeFlXL
	m4ziJq4kKwoMZvzNoU9le37KprBhyliVwzBYeDBvtY+IApDZqfolHga51pKkMz4=
X-Google-Smtp-Source: AGHT+IFX4/mGjG+vU95UUpnnLXRp/XwEI4DMPybRrGk+Qnnh13kjBBjoqh9gpDbiPP+7JCfYZqpAjQ==
X-Received: by 2002:a05:6512:31c5:b0:512:b773:2800 with SMTP id j5-20020a05651231c500b00512b7732800mr937004lfe.34.1708332871628;
        Mon, 19 Feb 2024 00:54:31 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id f5-20020a7bc8c5000000b00410bca333b7sm10516716wml.27.2024.02.19.00.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 00:54:31 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <20240213143217.336341-1-krzysztof.kozlowski@linaro.org>
References: <20240213143217.336341-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] arm64: dts: amlogic: replace underscores in node names
Message-Id: <170833287080.1749763.10941075703798896000.b4-ty@linaro.org>
Date: Mon, 19 Feb 2024 09:54:30 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_005433_679894_EBC3EB92 
X-CRM114-Status: GOOD (  10.54  )
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

On Tue, 13 Feb 2024 15:32:17 +0100, Krzysztof Kozlowski wrote:
> Underscores should not be used in node names (dtc with W=2 warns about
> them), so replace them with hyphens.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.9/arm64-dt)

[1/1] arm64: dts: amlogic: replace underscores in node names
      https://git.kernel.org/amlogic/c/f0ed445e7397e386264d4752a5eb5d2dfc7f7fd2

These changes has been applied on the intermediate git tree [1].

The v6.9/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
