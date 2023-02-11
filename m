Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0344DC636CC
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 Feb 2023 19:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZeHo3au9jOBjsSWTE0rX+kfSL3jCgu9GrQUBNTmrWOc=; b=cPKPnCrB8nid2l
	lPHODP5Kv4vv4w4aG05MiG4Ti8U+q8hrg9Qerfj3h+SdkdaDbfzsyANAJ1j3pvRzJFeGqVVkZKhcw
	eyBZx3nDJymCgd0FIICed6hsJ4nI7Y5dFqKphij89lK+StqphZ1RvCBWOwl5id28kfaB2IPuGVJ6J
	FwVYnJ7wbmLLFEXLGFKfHsjwy74eEkhupKQ9weUW+XYEXU6GSU0BIG/10cg1S4PeDIHsceLNDoAiQ
	s5/xYg5TzIW9nhioj4GFcwuw69LcUMn1zhs2PGfsKmh6yu/WqKvZwsOc/DETm0ctGNKKVIY6SNyYH
	e6Ho8O7ZOcUfeip1/XTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQvqV-00ACga-Gn; Sat, 11 Feb 2023 19:47:39 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQvqJ-00ACcj-5Y; Sat, 11 Feb 2023 19:47:28 +0000
Received: by mail-ej1-x62f.google.com with SMTP id qb15so21219698ejc.1;
        Sat, 11 Feb 2023 11:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vt58wxl/vfRdmQWqW6l46iKB45NYcQ6smTWDkh/oDOU=;
        b=NLIc72SU+vIVYdboVnsBBD3vBlXVZENUk2eaFzn8BWi5K6X/5U6rfMd3c8IHhvSdgQ
         VawWtejPFAra0xaOK3cYkFyoWShCdqs0yHEduYZwLhnJJfCO8LlKjZ6JgdM1+DlQcPXh
         JknfPhwzVNM+vX1HzSawZ6hRyZJUZ0wWUmtfSxsVhH62CyJrUulZfDIyT7CttFTcEK28
         kyxGRzuRr2ihLDClhf6UhhWgaa/13SruTIZNX5tcw64x1l2vp+35KG8qHGs/epSCLCae
         j4KdwDRaewPQtVlpG3qurebAiwGQK6ZLbkpAmgTHbweM95ZWR9KCpy+2aUUHYsHQLRon
         xYUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vt58wxl/vfRdmQWqW6l46iKB45NYcQ6smTWDkh/oDOU=;
        b=VLk6z4ncxrp8Y6Ym1D4wJ+rGWpyVcUp4iB59u2OTQjX8KWHtuSNLjyp/0YebKZBG7b
         Z+TjhX1F0aKrNIPdpeE7L2UQG2kFREXQQrR4Nq0VNHQ6j6pqvPqshHEzpO+MeTdiYdQi
         E5N0GPZP37qZHPopEaTwaey/T9WMzfi3DbfSZKADRO1CBEgkvw7lUjJQW7YVqeKN9hQJ
         O+3yvbzl4Jyma9hGW9t9rgi7H5dpzecx63m09cLRzv5GFO3v60ZDTJ+OjMqTQ9Ys8S0y
         cOviul2HryAGR63cINbGu7qF3931WVhiOjyn7PgsA0XATp3mAp1kHnGyVXhMF5wfELQa
         qw9Q==
X-Gm-Message-State: AO0yUKWDtqcmhoxL1QjOkccN71hwIYlgRjeM47iS2xIAqMu6XldqrAei
	F0VaApuurl9LpoO8kJauit4x8f+MNpVgjkVrKJk=
X-Google-Smtp-Source: AK7set8TuD+bcbyQ9zbkjELm2cwtzJgDzXWbzgJ17AMPvZMnyzWcMxqOZJAXTwXtATaSt6Bk4olnC2/42tmOo+kSAwg=
X-Received: by 2002:a17:906:4c99:b0:884:ead1:4e58 with SMTP id
 q25-20020a1709064c9900b00884ead14e58mr2614702eju.4.1676144843428; Sat, 11 Feb
 2023 11:47:23 -0800 (PST)
MIME-Version: 1.0
References: <20230207-b4-amlogic-bindings-fixups-v2-v1-0-93b7e50286e7@linaro.org>
 <20230207-b4-amlogic-bindings-fixups-v2-v1-2-93b7e50286e7@linaro.org>
In-Reply-To: <20230207-b4-amlogic-bindings-fixups-v2-v1-2-93b7e50286e7@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 11 Feb 2023 20:47:12 +0100
Message-ID: <CAFBinCDm=5oFLLC6Y+wctWaenM0nmpjKuNjkkWPzVoo1Vg2grA@mail.gmail.com>
Subject: Re: [PATCH 2/8] arm64: dts: amlogic: meson-gxm-s912-libretech-pc: add
 simple connector node in fusb302 node
To: Neil Armstrong <neil.armstrong@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230211_114727_261051_7B474940 
X-CRM114-Status: UNSURE (   7.08  )
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
Cc: devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-amlogic@lists.infradead.org, Yuntian Zhang <yt@radxa.com>, linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Feb 7, 2023 at 4:08 PM Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Fixes the following bindings check error:
> fusb302@22: 'connector' is a required property
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
