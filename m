Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AFA3C61DA4
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 Feb 2023 20:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aY0985q6y7CsvRms0kNpLzFJy77ECL5vuXm7q0p7Mvw=; b=dwfDqCd2gViH91
	JR9ke+m7DJGUUjSsLPrZzGz1pLIHPyZ//a6geW7yLyOUMDKG0OSU7t/UktQCiAw3UKALcGBAuymjF
	UaFRk5PQkI1HaXxuuThEfHcaKmvm2X0zCnekePJ63E1ThMZ6yUuiqOn3bGEUG+ERbmi7E7nxpy3ay
	Xf4A9J6WgE4QNsGHnzOC8rTkIUwWX0KmCQYZ1sX0kjZ8+5nC69C3o/4hwZtJZPEg+vf+rjX6idIlS
	o0HkqGURvuHUvStefBCQ+YoucpAemndf9ZUZOvRX98/f0XmhGN7X/SLItq3F/OGYMVwHulOeRfBqP
	YnCLonOqJyEui6ZHQ7yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQw8z-00AGXx-T8; Sat, 11 Feb 2023 20:06:45 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQw8a-00AGGt-8t; Sat, 11 Feb 2023 20:06:26 +0000
Received: by mail-ej1-x62a.google.com with SMTP id jg8so23351206ejc.6;
        Sat, 11 Feb 2023 12:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HqCtyRejI4LLye8LToLaeilzkCo6PSscuoTSFnoz9AA=;
        b=KWlQuieaEY0T9+WI/Ae3ej9OdlfQLPs87lBnTrDCv4VS+mjwBg76MmJUtIoGx9vQYM
         z4e3nlYktL7uEoX0KS8NjSVA8wV9ZMCuLNlrIwgkaFnEJEp5spWIc3ejag9k+8JDOfYg
         DfMKnQLVnuMXYGgakBwQAzV4jtYT5TFYT93q66YIlzqOm4DvePPOt8F1ZMFVnc66qGzX
         ai5rXXDvHGWemdt49adOuNSjddGoi9eJnIHK5hPKs7/7X6z3dcyuNTae2DikxwIAsl3v
         EYU81ZHGd3gh2euzA0OaLu/Nc0CBRRKHUTbWh8HgWp1qEynKm4Fza9BVhlLQEPNJuPy7
         nk8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HqCtyRejI4LLye8LToLaeilzkCo6PSscuoTSFnoz9AA=;
        b=0iWODT+nofdcY9aGHgWWVrn26r23DBoIkIYi0qSr7FXI3Jqi5nynCH4z7X2ki+IYet
         MZwDKjUkC5pNze0d9nhcUkxJR95iHzdxKOXgqhiiKw4K8CH1IddP61ZrowC0aFUVw/0Z
         oHStFy225G9FQaocw7TkKHtbdR5dddIlrXZ1xULUSvoYb24UY9X30Q+yfs5zvErLP77q
         IxbqWOECu453t3PFmvNJtmkCIvLO40NWRJzM8dieOmPPpDXzaBotHyaOkOwggzuk++F9
         yGePq0PITGLY/i/dSl8kQozCRnxscaY9p68EHBHBv16Zt51C41AMY5KVSBsTL5s22ovw
         73Fg==
X-Gm-Message-State: AO0yUKWpch8d+PQRAaDOGqrdhf/Z2pSDMBbxdBTCfvGUlJQrRrIo5hCA
	6J/SFVuILpxWuKsv7xEYQYwGNg9mDbdcvKtwv/g=
X-Google-Smtp-Source: AK7set+jUMcBstRu6KjIMkla5m20N/WtKCrZIy0hBuHNgkrs0suDuWtyS0++oPitclH5cc354hte0BFMcD3k+UyfUIE=
X-Received: by 2002:a17:906:4c99:b0:884:ead1:4e58 with SMTP id
 q25-20020a1709064c9900b00884ead14e58mr2627530eju.4.1676145977931; Sat, 11 Feb
 2023 12:06:17 -0800 (PST)
MIME-Version: 1.0
References: <20230207-b4-amlogic-bindings-fixups-v2-v1-0-93b7e50286e7@linaro.org>
 <20230207-b4-amlogic-bindings-fixups-v2-v1-3-93b7e50286e7@linaro.org>
In-Reply-To: <20230207-b4-amlogic-bindings-fixups-v2-v1-3-93b7e50286e7@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 11 Feb 2023 21:06:07 +0100
Message-ID: <CAFBinCAeN5gUauVpHgj02SUrbDZfEo-MBBE+=KirWnAbsiHsig@mail.gmail.com>
Subject: Re: [PATCH 3/8] arm64: dts: amlogic: meson-axg-jethome-jethub-j1xx:
 remove invalid #gpio-cells in onewire node
To: Neil Armstrong <neil.armstrong@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230211_120625_491171_32BEFAFC 
X-CRM114-Status: UNSURE (   7.85  )
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
> Fixes the following bindings check errors:
>  - #gpio-cells: [[1]] is not of type 'object'
>  - 'gpio-controller' is a dependency of '#gpio-cells'
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
