Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A967CC636D3
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Feb 2023 19:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=txYZqFlnz/4dSCIV8aE6sACUfu2gJYk9cUtXcsB1Y78=; b=L0LCZ8q6xKCmMa
	haycReHXK5NFrs/koPR4tIvA7HZfQJAK3n2wz1XlkH13h0+AFMSSVa26SCzVzUJCTxUz/ThRso3Cq
	QDAQf9jQZFeUYLs6zFmh/LtDo/DcEEhJ63ImgDPW7CIRTeO/LgYSBCmEP0Kb66U/Q2auLDNmafI61
	vL3q1u/brG6EaSMByhYcFDiQW/puwVxjT0/rULTT8dKhxam8ioah4HrfgaIrHFVO4rwxOBAIcqX42
	JpugulJ5F8Ssz0kvxYFmEWfQKHRy6D9AfXouFW0U1JLB+YmQd1A+nx1JsnvO0LIXrdjfW66S0n9Dt
	XvsJtZiZE2Endn7yz7iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP6vy-009gqE-TT; Mon, 06 Feb 2023 19:13:46 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP6vw-009goZ-Bb
	for linux-amlogic@lists.infradead.org; Mon, 06 Feb 2023 19:13:45 +0000
Received: by mail-wm1-x332.google.com with SMTP id m16-20020a05600c3b1000b003dc4050c94aso9654518wms.4
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Feb 2023 11:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7TTlok+DKoN6O3XZ3ZYCY2Q6A1YUCFwItnfjnPnLbF4=;
        b=yy7PWPFv5Tvm3H5w1E3b3zkysD1tPRSBhTCWpcA8S4HvTxKLmgaRWjLKcCENv+I3xz
         aMSNQLk0FXCBaDkAx4Av5pJOnx0gz4trqrppVpPitRTro3gGWSYTZo9Jr0nk88FjAwoY
         gWDgmq6e+Tqe8KChXgXnSngzlFSNrD7xgoUPxr17rqf0DZD9iazVAXxDMDzxksiRplk9
         OmMPgpDv5Tixu7Ha7eYCJTSJySWSXVsa6mZMwY9We3IgxenX8VGKnpwSE22vMeDW3MAR
         1apdIyrHfUKzsyTlRhJH9+K67/ChkoEdYxA/wdpMlFbtoJQI/eu0Ae2ECk7QsCElTPOH
         UnZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7TTlok+DKoN6O3XZ3ZYCY2Q6A1YUCFwItnfjnPnLbF4=;
        b=g0o3gi95Rfrvqx4GHe4cbY+6s4m++0MNHKtZqvlMCIellzPkAHkR1MOt40wLx6LBlC
         ONLf3TL9VrA4C2q9iXVq+LrF4ms6SPvozC6Id3YCQ44J7M8gqKkoLznpD+7n34rDRWTf
         QjbVsKWqkpWLJIxWWprwsMLE2Jfgh+ZSnIMVyPzmQ2Qx837XCqHXlr5v+7KUb62L+KrP
         0N2e1fFzL9JZc8rkwx+ZSfjZIKhiZTB9AneDH1HZ4wgHJTrdmC+dN0hgp6/n08ZRDmVP
         yW8Moh6hBZNjAXaxfNAl0zMSRZQL0m8Wwyjzn9GHV0QfsfhiAVZke2bjPcSGD5OFoFBr
         gzbA==
X-Gm-Message-State: AO0yUKUzNwM5R/BN8/wYC0ox4VaHly7hfeXfA2Vo1cdTGTREngWdOG16
	CZ5hnaku9vcbuSWQ5ndwAw8uCg==
X-Google-Smtp-Source: AK7set/KRsDcK/zxUA5o+jJRPiuSJzcbAHawtsC9iDyjpBSn2QTjdcP+RmSVBEYfYRqjBTipYJQWyw==
X-Received: by 2002:a05:600c:927:b0:3db:2098:17c0 with SMTP id m39-20020a05600c092700b003db209817c0mr965208wmp.29.1675710819068;
        Mon, 06 Feb 2023 11:13:39 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id s22-20020a1cf216000000b003dffe312925sm4980723wmc.15.2023.02.06.11.13.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 11:13:38 -0800 (PST)
Message-ID: <54cb8869-3d71-367a-0790-323ee0906614@linaro.org>
Date: Mon, 6 Feb 2023 20:13:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 3/7] ASoC: dt-bindings: meson: convert axg pdm to
 schema
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org
References: <20230206153449.596326-1-jbrunet@baylibre.com>
 <20230206153449.596326-4-jbrunet@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230206153449.596326-4-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_111344_428072_3CB36DFE 
X-CRM114-Status: UNSURE (   7.48  )
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

On 06/02/2023 16:34, Jerome Brunet wrote:
> Convert the DT binding documentation for the Amlogic axg PDM device to
> schema.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
