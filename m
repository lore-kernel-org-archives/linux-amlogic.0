Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5C4C27C52
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Jun 2024 16:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t4IVA3NdYd1IcoXTg0rJqf6tn4gKKd3R64t9wOgGzlY=; b=U4TDQd0xL7yX1q
	9DBePhrJj/fPuHJ9JZg52j4LD7Lr361GX4aBalv194Lq8FH8tMcQadV0Lj+R4mYsBLDwNK4yAe/tP
	UaolO4aEHojCiBQWmUmF+z5FNWPEIjXX77uyDKGzlNi/jP9LnhtxPJg7/bffMHsb483eQDbkhpC7V
	PzsE954W+RRViNEeqHteMRbrXmbdEe0pgVmc4DnK9ccQBTJnaFjKDksTZHE+r6Tg/Z7jIQcRERat/
	aF9tLa6ymeBFEVFm0ZyjPfRdPWSQJHbTMJuEuN43541ihLAnKmN534XyW3uiNbNkREmH5h2tXtnOM
	8iHT3G9dj2kc61RF8Vug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEWgm-000000033zV-0O96;
	Tue, 04 Jun 2024 16:07:08 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEWgf-000000033uy-1g14
	for linux-amlogic@lists.infradead.org;
	Tue, 04 Jun 2024 16:07:04 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-35dc7d0387cso5899809f8f.1
        for <linux-amlogic@lists.infradead.org>; Tue, 04 Jun 2024 09:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717517218; x=1718122018; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DVcQEIP+MENTssUPsqaOZqlKvsqibx0etjqeiTYhCrQ=;
        b=MyaNhD88jP8t4ev5l7GQzlz3bcj9yR6SW5MLFwwRxb5xdh7HMC0LQqjS8bFYnXaPbA
         ps4SZQkVmcr+gSnHyqgwGXlcPXbmP2T5O3H5EUov7YfUV5db0r5iNsyyu3g32SBqX4d5
         HTK0EcWqyNE/ABKN74F0SQZbRBwVo3dXJf3DjAEjm5AJd2hGYGgXHshekaeQ8JHBrpNJ
         xyGBgwSeZHpgo7PZVNLYArPeAdesMxLPII/boAX2dUiybA1HBvbCl0Xe1egvg+bEzzRC
         SB/0gytjLJkzzVbdrgLTg6X5WSVjUwlhJLyM50u2nopPkOVTZ8aIKBMI3eqqZDRVXNVP
         XQDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717517218; x=1718122018;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DVcQEIP+MENTssUPsqaOZqlKvsqibx0etjqeiTYhCrQ=;
        b=qE1vpAfsBTpERj7jmZQH443iVAzjZvJfDqPJaCiyjASXzuPy0vkkDcR9l6nFNcxxQA
         qJQorHCVcYOfQqWlbSgYPQgD4vpfBaPbmH+IM9kMIn6zqPWMjJ/FgtZa5jdBR5KDg7xU
         ea3RXLFiKqjewx7SYg74jofqArBv6pWiUDKc+rTFKDTYiz5Hvfe44u71sOFCaaHGJf3X
         Vn7BNcARurfedHlW2Hsv782+6RXWXuQJH5DCeb5q/w3OdWlsx7GxQqOYpbjlGjYfQwLe
         4uJE6uEKO0fWyTzqwMV/N9VSrBZI3aq1nbu5yxRkJtMooCkZMsR/9GQwEcVHVEEoM3uu
         sumA==
X-Forwarded-Encrypted: i=1; AJvYcCXNTK+wb+XAQGyVs2tUytTaZWmPwE1zYXrsUzH7SJDH3YIxYIvAyXdTa4I2mgeWmW8L0CXXrVoVM8TLpWgZjioGKtigjutroHCjVlXePBbSiPA=
X-Gm-Message-State: AOJu0Yy/EokQmST4dPIs3DXCLVBVAsf6qOM1ArUg7Vyi/oxsvDyJmL5N
	BGcwzQIOTmNDqLiZOFkn+1xfMAewoyhSWq4wM96cjlugPVBsq6YSc8rXf20+/Ts=
X-Google-Smtp-Source: AGHT+IFYA1dhRvmL2GTj5Q6k/vk2zOUsQMMogmi/rc6o5NV9inVq5WoI7Vq75aDni69dzFSZ/DMrow==
X-Received: by 2002:a5d:438e:0:b0:354:c43d:d5a with SMTP id ffacd0b85a97d-35e0f26984cmr10765554f8f.24.1717517217961;
        Tue, 04 Jun 2024 09:06:57 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd04da756sm11983392f8f.59.2024.06.04.09.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 09:06:57 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Vincent Shih <vincent.sunplus@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rafal Milecki <rafal@milecki.pl>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 Joy Chakraborty <joychakr@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
 manugautam@google.com
In-Reply-To: <20240510082929.3792559-1-joychakr@google.com>
References: <20240510082929.3792559-1-joychakr@google.com>
Subject: Re: [PATCH v3 0/1] nvmem: Handle actual amount of data
 read/written by suppliers
Message-Id: <171751721565.70889.16944298203785853489.b4-ty@linaro.org>
Date: Tue, 04 Jun 2024 17:06:55 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_090701_574285_CBC1C2C7 
X-CRM114-Status: GOOD (  11.09  )
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


On Fri, 10 May 2024 08:29:28 +0000, Joy Chakraborty wrote:
> This Patch series stems from discussions in patchset,
> "[PATCH v2] nvmem: rmem: Fix return value of rmem_read()"
> (https://lore.kernel.org/all/20240206042408.224138-1-joychakr@google.com/).
> Where we come across the fact that currently the nvmem suppliers do not
> actually let the core know how much data has been actually read or written.
> Instead they are expected to return 0 for success and the core assumes that
> the amount of data written is equal to what the core has requested.
> 
> [...]

Applied, thanks!

[1/1] nvmem: Change return type of reg read/write to ssize_t
      commit: f5de138db5b76de7d96d4cf92f871ba893ba0119

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
