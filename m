Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79948C61DA4
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 Feb 2023 19:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P/2VuhhKH+50MaU0eeUBKdW8+CHPoRrZLJ8Il4DFy+Q=; b=yTcqUXE3Qm6WYd
	blYPGqvk21QzzjeipvTS1RCMhVu4YV6Dfeu8A9g1zVMYZNRn6J0z7nHEBzmqBsa9FNVolCItjo86k
	WVQ+PH80twMo9L6jcBv43Q12DztKw+YaECrpxbzmgDp8F7znkkEu8ffyWYLvRo16lDCugf86cSRZu
	qv3/ahu7zUhMyrTte2waW+eF/k4oUuHtnjgsLud9yv+EaMUorsrJVC+VzzeU/UoFEH/Kldf7gAts1
	O5dOj+65adHMKQsXem55R5Fm+tc0NDmbuE9ERUPpjvz0rof9o7HU1dfNuLaYDbcO3LPgX0x1NrKId
	PBzS/dzcDCttsXqhYsow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQvtK-00ADI2-Oi; Sat, 11 Feb 2023 19:50:34 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQvt6-00ADEJ-Ut; Sat, 11 Feb 2023 19:50:22 +0000
Received: by mail-ej1-x636.google.com with SMTP id gr7so23295636ejb.5;
        Sat, 11 Feb 2023 11:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1NY0lTq6XRFzWeK6BauAkw8Er4oDHGUHF8zMRIiJVIw=;
        b=jdJMcq8JEf21/rWEpQtsdAz4Udz0L0X+BIZY6WBynjAiuyo6NtpeKVoD9HrkC0d3qK
         x+uTVszRsHVkrEBeiqo7t/qRuo56o9mkKAxf06Ry5lqQo+F5MrZMSCaoCPrbVv3W2Ri4
         f5PQOulBBLhJ4j4QoZuugaVLSIxflGcgbFwg9QDLBLb8gMz4eg9BWbZTpQqY++U+MHy2
         W6Cg5Lx4OfPVy4fgKDjtN7xMcqA/e+AS+fbLBkGJ+Tv2Ox4esUCQ6tcks2THK6Mo9dR3
         Es+yGqNoOm9gt9U38Il4gGZfV4yXesN2mC4meJ1x1QXKOQMIbXwemHwzFc/FL7/1AXs3
         kRjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1NY0lTq6XRFzWeK6BauAkw8Er4oDHGUHF8zMRIiJVIw=;
        b=lyGFuwzEOpRZfl7uKjD9XHr5uAp12e5iARIxdZJPhnZbR5VLVoNaWwuOSB8rPXf91q
         TKx74ig6SoL6pU9WttgmbHI1uK0GLJfKRdRIKUrQ33lk2ESOm+ZrV7zii9LdOosdBPoB
         rftPOWvmvYpVYi9sSL98ZEd+UfFa6N1azUg1gcADKTynXOiwj1jX0Oym8kJw5YJvp0nj
         SVXzvZ9QcBLu1k5kDchI2AvT2GSRds+ABstdaQz3brGb/BY0lVJXgcwShgntoi/UcxNn
         S8VqmpGVz+VkV4g0fA6GjtxHkkP4bNUO8XAVv9TbtIAAff1gLbfMQfhiMH4DiBNT/4TD
         rkVA==
X-Gm-Message-State: AO0yUKVEr6cY/K2qxWPJ5aNiM7hlFPY7nLXqV2WiZ0R1qyjz39mAytEm
	bqsbCal6bFq1ogeIm/0zn8MH8MhkC3AsyGbgXSI=
X-Google-Smtp-Source: AK7set8RNi1bP5tZb7wWagCdIiM6a34gDYLNL8M+gVIgqsCY6CtOYw2JFNZy8IfbS4oNq7GMIfY5dz2l5s7fqg5+3QQ=
X-Received: by 2002:a17:906:241a:b0:877:a0e4:4cce with SMTP id
 z26-20020a170906241a00b00877a0e44ccemr2606921eja.4.1676145019357; Sat, 11 Feb
 2023 11:50:19 -0800 (PST)
MIME-Version: 1.0
References: <20230207-b4-amlogic-bindings-fixups-v2-v1-0-93b7e50286e7@linaro.org>
 <20230207-b4-amlogic-bindings-fixups-v2-v1-4-93b7e50286e7@linaro.org>
In-Reply-To: <20230207-b4-amlogic-bindings-fixups-v2-v1-4-93b7e50286e7@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 11 Feb 2023 20:50:08 +0100
Message-ID: <CAFBinCCXYHkovYALUAj+1rkos1bzXfa2_JOqpnHsW3NSrpnw9Q@mail.gmail.com>
Subject: Re: [PATCH 4/8] arm64: dts: amlogic: meson-g12b-radxa-zero2: fix pwm
 clock names
To: Neil Armstrong <neil.armstrong@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230211_115021_014790_9A14B2C4 
X-CRM114-Status: UNSURE (   8.59  )
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
>  - pwm@2000: clock-names: 'oneOf' conditional failed, one must be fixed:
>         ['clkin4'] is too short
>         'clkin4' is not one of ['clkin0', 'clkin1']
>         'clkin0' was expected
>  - pwm@7000: clock-names: 'oneOf' conditional failed, one must be fixed:
>         ['clkin3'] is too short
>         'clkin3' is not one of ['clkin0', 'clkin1']
>         'clkin0' was expected
>  - pwm@19000: clock-names: 'oneOf' conditional failed, one must be fixed:
>         ['clkin2'] is too short
>         'clkin2' is not one of ['clkin0', 'clkin1']
>         'clkin0' was expected
>
> Fixes: d747e7f76a5f ("arm64: dts: meson: add support for Radxa Zero2")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
