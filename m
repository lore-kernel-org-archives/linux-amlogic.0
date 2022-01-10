Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA93C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jan 2022 09:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=qWmy+oyT/ga/A4/b7ul95MaNqx/B9GWXchCoro26iiA=; b=fDBJ6+IWEo1v2oRn+cQT13ioBS
	N+w66HxxYFTcI5NWxtknpTSfwCU8OqBPsTG+XYtFTUyKzo1a9kQ9sayt/2xHdlh56UUWvSvWlpemU
	BGI/M4kCkWba7vN8+krIbayvEmDKYz7XJYO+3iU8Gi6rW6o/RITieZnXB4jbmTEpGQw/2FvewpnP+
	b8nkld7tPl5zNGaYauxj2YKlQzQmJbjIz6soKDQ213253FSLqCVZsA3Sx/LYOYPozaUpJsbtx7Shm
	dabEAPdsreuHVzmubDjtE2HVnYHYDiSwDGtUh9Ou2l2WzzQvZqcCbq+xYOW99ur0WsqEfOJHZnAMS
	VlHgZXBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6rJa-00AZVy-V3; Mon, 10 Jan 2022 09:50:11 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6rFr-00AXZv-4z
 for linux-amlogic@lists.infradead.org; Mon, 10 Jan 2022 09:46:20 +0000
Received: by mail-wr1-x433.google.com with SMTP id o3so25556234wrh.10
 for <linux-amlogic@lists.infradead.org>; Mon, 10 Jan 2022 01:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+abZjbadrthkxAndrqLQ/y+060FFMnMwVyalc3ssY1Y=;
 b=sO2E/PaXEhSg08nvq/BCgxO8/eqxz7kYQykOe29ZAMGqlz4RjZiVUTmKtkK4J+qI6B
 FHSGBoGhMWSscRNeJOBxhZXeQhcZ6InnvUpjexCThxUsMuG2bYJfqoh84D0VfH+pxv0F
 TQsxMrKdSyMTSok4d+LNJ2ki7L6oJ4cCQcdb9ZnNqa3m0g4plEsiLJkHZB+uXtOX2/ep
 0b0X/KT4oa9N/SstNfh5gD8g7Da74iLwCk2nxP3+RdIK3cQRbMJTjiiZNthu6yIT7VCM
 qoZ23WmUA6bTE75sPMRidBuaPMUS8NEMoasXzRkI+vktnP0TwK8SyKZjKJALt2slE8Y9
 yovQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=+abZjbadrthkxAndrqLQ/y+060FFMnMwVyalc3ssY1Y=;
 b=WY3m/PKXHDNy+YzHBW77I8pELNaTp49U7h+4OBNWPzupYKLl6ohx2IJbFbDkxzIYqg
 G0wUO3qTcX6h5K+bluUhg0nMNx9LBoIwLycf3cA516U2Ox7dBIhibQMTXxyqY2lRYnz2
 swlaJCkaKRmQbrgoiUK+EG7CaVQewARHZINmja8OpdvT+CjQR3yHBtUNL3DJi97s0e9q
 /fx8eFZgxFnA1kHFWYgMMzqbtAT1Mu6tjvHQgJ7OKLRchb9a/fB6DJ2eu/o3BD8wMmxA
 JOpkTh+tQsPtp7D6t+T9t0oDaEi9/xK7Mga+Umas67XrNeOo3WagrTS0sXUXpFfWC/DA
 hoFQ==
X-Gm-Message-State: AOAM533f771iULnC6oKIlA0UHQAAwNAagy/jb6RiQuyyxAgzULl9jHCH
 f4Rl3jRCpaDtHSjOmLXM1yOr0bOlCghreg==
X-Google-Smtp-Source: ABdhPJz1VFZkwqr2BXYdj3OFdBaCpkLg0P2ezfDFiTjGjOlfKUP0TggZS0l0V/6zvUk0jNJegfFt3A==
X-Received: by 2002:adf:fc0f:: with SMTP id i15mr5742743wrr.467.1641807977299; 
 Mon, 10 Jan 2022 01:46:17 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:94e5:2e36:6bcc:a9f1?
 ([2001:861:44c0:66c0:94e5:2e36:6bcc:a9f1])
 by smtp.gmail.com with ESMTPSA id u14sm6078840wrf.39.2022.01.10.01.46.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 01:46:16 -0800 (PST)
Subject: Re: [PATCH 5/6] drm/meson: add DSI encoder
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220107145515.613009-1-narmstrong@baylibre.com>
 <20220107145515.613009-6-narmstrong@baylibre.com>
 <CAFBinCCR4zftkvJWgX4T068BRsjVp9YhRbzgdBOR+tuMcGSZ3w@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <b0200846-0346-a65b-ed98-c0c778040cd9@baylibre.com>
Date: Mon, 10 Jan 2022 10:46:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCCR4zftkvJWgX4T068BRsjVp9YhRbzgdBOR+tuMcGSZ3w@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_014619_268336_09421634 
X-CRM114-Status: GOOD (  11.21  )
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

On 07/01/2022 23:35, Martin Blumenstingl wrote:
> Hi Neil,
> 
> On Fri, Jan 7, 2022 at 3:57 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
> 
> [...]
>> +       writel_bits_relaxed(BIT(3), BIT(3), priv->io_base + _REG(ENCL_VIDEO_MODE_ADV));
> see my comment on patch #3 from this series for BIT(3)
> 

Yep, thanks,

Neil

> 
> Best regards,
> Martin
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
