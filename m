Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE4BC61DA4
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 Feb 2023 20:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z9ehOJX4CMK6V5l5OLh9lhGLfvHwh2lYyELMUl+2r5Y=; b=kA0I6ZqZu1N/LZ
	ti+sZ+nwpXcAkLU2ING9GlpGXJc7zuJWRFLXrhd1q39P7FiQtTQKwkPyub/m7z6r4JWT8iddZ2Und
	D9nEYF3oJPsI2OsJmD8MEf7oakHiqOgF69L6S4LLTEYSVdyb+vIZQuqldFSWN3sgS9JBp7yc0DS84
	8Llh6A0JH/kFLS9hLWNYR4wgQaPlRSs0MXuopWPVb30pEmLNHQvqvToAeEMHVAcZZKe3WKVUxMCiU
	z2JLe8F8T0Mp6C+Gkys56n8QX30igyIU51DXF9xWiCH8P0A3sc8trUS/eVpwO7LAy5CwXeM4ksfOr
	zvYYzNr9Gux42IwhoMmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQw8F-00AG2Z-QM; Sat, 11 Feb 2023 20:05:59 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQw84-00AFpU-Qr; Sat, 11 Feb 2023 20:05:50 +0000
Received: by mail-ed1-x535.google.com with SMTP id s11so567632edd.10;
        Sat, 11 Feb 2023 12:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KzDSfUuHoNboS5QzLEHJDCgvHam8ZLPZmhS8geBp4Dk=;
        b=kdX2lmhKxfR/ZMgxVpRW62qTK4BVDwB9SKRoEdGRQ3HzHWex/WAfUuaM0Z8VrWHskM
         wt0DVN0FTRsYfOr8KA3IqKlWpIpzPx2b+3upOe4/nn5WOfLk32KVVA5Ox6ZLS9EPV5EA
         W8wuLB8mw9lAqhGSEdE2OZUh3VwmAyEyaN7kPkcs5FQ5F+8CzaHWkrml3Z28FR4fmmvc
         LIKwdIGRsIMwZKcm6Y7jMWXg2vpb9aNBmkiSuIB/BR9h4QkQG13r66fnsZRTDPM3J1pi
         sGo1qL9c7wy3xlMNysL80YNUENI/Ix5qry4s3IZ/6TkjuhH5czuWtPUDwUZ40eA/qM01
         1t9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KzDSfUuHoNboS5QzLEHJDCgvHam8ZLPZmhS8geBp4Dk=;
        b=rBn//EOnjSheqz6fDyuq+85EuX3FZY9Ux1tZH5Bsnyfd/Un+i84iEe+FMWI73XUhkv
         u0iUvWZKG+0jW6iDUm8+18DhtNtYqog2jWyFsCH1ShIDmqj61LseeXhPGjpP6v4VCIOr
         8RGsrXqHZKLJaW9+Z3ywz5nYJZXmjP7XF1nXUiJjy8o6QgfZIE4WttZWpxWY9/3jTVVQ
         6mILDHZSidD/6oFSIzFRVJ+HJYCXnBuoADxJtpwNgVafphsEc0K/Bd432Zz4hTJ7BWiZ
         VsQ6LoT7vVe3INqbk6qy80pKi7LEoVy78rTSXKAmwfIv3QzFXRvK/YWATp9pAKZjqUvn
         a+xA==
X-Gm-Message-State: AO0yUKVXY26HlNELn52lNSQAtuc87bCrTYjDYanCj2XVhHDqVoBBIDpT
	rhxfDYKdRzLXMLSxh6c7Id7VjfQmOTH26eyu8BM=
X-Google-Smtp-Source: AK7set+TBgxHZk/FJCszd+S4lVDv55G9LzI1GuUXh9/iIBefxgoFcd90YDIzCQJeclA6A6UWN2PrAtDe0oYRV7VvRMY=
X-Received: by 2002:a50:ce59:0:b0:4ac:b8e1:7410 with SMTP id
 k25-20020a50ce59000000b004acb8e17410mr866928edj.6.1676145946715; Sat, 11 Feb
 2023 12:05:46 -0800 (PST)
MIME-Version: 1.0
References: <20230207-b4-amlogic-bindings-fixups-v2-v1-0-93b7e50286e7@linaro.org>
 <20230207-b4-amlogic-bindings-fixups-v2-v1-7-93b7e50286e7@linaro.org>
In-Reply-To: <20230207-b4-amlogic-bindings-fixups-v2-v1-7-93b7e50286e7@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 11 Feb 2023 21:05:35 +0100
Message-ID: <CAFBinCAJvw=N=KBcmbkLfg10brEwDN1sgSeofqxaDJ0AfydUAg@mail.gmail.com>
Subject: Re: [PATCH 7/8] arm64: dts: amlogic: meson-sm1: use correct enable-gpios
To: Neil Armstrong <neil.armstrong@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230211_120548_889724_19D0E74A 
X-CRM114-Status: UNSURE (   6.94  )
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
> Replace enable-gpio by enable-gpios to match the bindings.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
