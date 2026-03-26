Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 234D110A3D8C
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Mar 2026 12:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YWg70IMTw7e73H7cEY6Oz99vADQGbufYVSe3pvZ1oPg=; b=xqg62oZzWlnebH
	pn1g4iShrHL4jERlqv0moB8V28CjPXtCz7hm691bTcF4R4mcCCuaMFVywSncPpa5CXIJKz3j+F0dj
	HuY/rlBaY5NlcsmNgBjhtbQVPwwanTwcspIJhlyNFfQJmXhu6UUgd95IL9H6ZoD0Tm723PIdt8TZ4
	mXFwilMi+iMXkAtXyoVl8hXN71TJcGZa8nIBKYLLvT/qwR6sPNf7v7iRuMPz5Fq72E7bosZ6XOm3D
	XV2RLymvFOzjVg2eHjeOS+oQG2t9mBz6szz9DA4QD+hNCmiZsuyYX7UTuhxG2FqL1FTPJpiXgfgfO
	l4Uv735/0eIoNYAI4DOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5juG-00000005RzA-24Ah;
	Thu, 26 Mar 2026 12:33:48 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5juC-00000005RwB-42Wb
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Mar 2026 12:33:46 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-38b13652c87so7822901fa.0
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Mar 2026 05:33:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774528422; cv=none;
        d=google.com; s=arc-20240605;
        b=N5Icne8SwlwiH5QNvc68xGxN4E1omIz3KT8gMSL6M7hZU1UeuIAW0jXdcw0FrYfa4x
         fAiw+avnu8Jw/Bz15fwloE9WYB237OxXF/T4smWjxsOBot5ZqnvFIGekipod4LBaCIUj
         PR28rtIxJt0mACf9qdzvO216MA0i7H1pXZGeeajhJ1agL1M4d49lciJ8ensnsU1V2o4o
         hkx+7IdFJL3Cb7uHQvx7dhdkzjh/KaoCPV8wxylNoLl/ICwnROk8BuYKKPIoBZAEEVcL
         jnxkSPQXgMGNSpJlVTJiiA1QNhYm04uc0HajetsduxodqFG4OxZgVJChaeTB+PaXpz2b
         GY2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4NdPYgPAlCNYmYAY44z3R1vgWi5y6H5hfActLsqe8b8=;
        fh=0g0vPF4PXiBbrADU0rQQbUM95tU+vKfOg/JmfPXqrqw=;
        b=OUPYlt0iAKEOIkyekJ9e/E9q/LfxFDW3quj/yVrptzMirNaM4CTk95oNNQz7uk/V3u
         AGxxNTF/vH2BjOrP4chwyWzn1kbRslTweVupvWgqS0NJJ/2acrty5lvUOEq2ItAfcKvU
         DOHVLei2Rd5g7tqLESre2Ha9f/qYW+GJX4TjDfrhGZ7UnTT9DvTC5GT/2fKd+qBMXXZ6
         HRNRDxO2bhG0BUaKlCsSJQUfzhjBVBEt3UN9W97r4mL/sSX4DalMagzYMLMgjhVb13aV
         dYSdG9KCH92F4qXxUbYyO4pRe6/OysbMYpUuLm8NLgf39KMoSqnVmibjjwvwkjW6ol+7
         lx/Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774528422; x=1775133222; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4NdPYgPAlCNYmYAY44z3R1vgWi5y6H5hfActLsqe8b8=;
        b=NV508e4/Xa/OTx3fLux1n37uqAV3u93062W6C78Fn+b+HPK1X0WxJeHumnVg4HIyBg
         T8SdaqPGsGBL5+VxF4RcZR3xkwoo8mE1EeXC6CiiomwzO/Jvn27LpFj5mtLqOAXtuXOe
         kwvRp1gZ3jedMHZmZPesUUT3W0u81puNDWmpJUrRlZwwYjjB+gefPPydgWWSllQ5otfY
         YRs0zaoR7xhsaXDHc5ge5OCMtOSF4SSzK15J3+hdVTy8aH2AdbWbxTr8zByLo3wMQNM9
         KipV0TNOYRVov0BM2Ui9wc1UmpsVoUBdDjyu0ljXPfa5f1GU8/XF+uzuXe6AlSsVx9Kn
         fhqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774528422; x=1775133222;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4NdPYgPAlCNYmYAY44z3R1vgWi5y6H5hfActLsqe8b8=;
        b=ozyBKYTWgTBu0GeoRps1FAzOIwYG6p5AMZ6+2W0uspgG5YGIy8bBe+tEBY5ScoxWfK
         9ZLIgQewDnEL9ViFUAOxIMoE5fH6HmjcQi7COc68rEAEa6CsFQ7ajDG/oPW0sfDxo4k/
         O3VhdpAAFotc0UDsUgvzNZxO3y0YlxTUK6r3FHwKVMNfOnylYoPkZSzjDgeytVIA7dKS
         jBzG3iehPf+AaCstnBz9LS0uu9sx0NFMWsrV34cvj5kiw0CkzdbTaMsWYRhPgLjCv8oV
         5YA1p0mL7N7jpwCmPXxNm34s/qKIsiyWT/1JMa4rOYzeK6AUC2xdItYP0bw9nc8Q/hhU
         3H9w==
X-Forwarded-Encrypted: i=1; AJvYcCWzg2uqbLBsFXN8bPOUv/v6o1hp4Iwdf515ucqc6gHFp9XWECjxBdCLqHEgIgD7tnDUCmr6M9S2gh2qyHRH@lists.infradead.org
X-Gm-Message-State: AOJu0Yxcq5UVUnku2eTP4RKe9lWwFGgwlXIRzmKgzKdY2BYplkulA6Gh
	vPfQfQnXWKL36cHQ+x0El3m4P8WO7UlfuCju21Bp3KxXkZkhGWddSjXp5g0IbfMzpLJLVzKh/TY
	SQ/+KEm2LOD487rSicxVMlA2jGKQLF40GQv7CxIbC/A==
X-Gm-Gg: ATEYQzzgtu1W5O84PKu4nhEt09UF3Q0RfaHMOr0Bkbqszzr/nMjF4jF7J9yWUy3SrsJ
	q59214PLK7KV8Dl2PxSiN25gWmWwZeXFdhhOg03cWJvTBCev4K2IRX1SjQTSxxAUB8yJAsmWJRa
	xQ+UaAEDzWo7IvMrNYqEWBCHtnXhfAS0g243nuKI8h7Q7vuMDeEC4QLdvNji4rNkVTyyOhfOwWJ
	QfU9vBBgUZucdAhA2AZhGGorir6t3Ds5GYBNSkk7XVhS6kZKHvC02C4y1H9RXoD1B7cvFbxhz9+
	K6ysmwg=
X-Received: by 2002:a05:6512:48a:b0:5a2:9cb6:ef4e with SMTP id
 2adb3069b0e04-5a29cb6ef5emr1889782e87.21.1774528421913; Thu, 26 Mar 2026
 05:33:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260326-add-emmc-t7-vim4-v5-0-d3f182b48e9d@aliel.fr> <20260326-add-emmc-t7-vim4-v5-2-d3f182b48e9d@aliel.fr>
In-Reply-To: <20260326-add-emmc-t7-vim4-v5-2-d3f182b48e9d@aliel.fr>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 26 Mar 2026 13:33:04 +0100
X-Gm-Features: AQROBzB17m2aMMak7aWoPUlujOd0n_VyTP6ICjVn8RwU1l2ZGeIzCfBikAgvSj8
Message-ID: <CAPDyKFpacFOs_T-Q5ETAEd+bjqtx3J2mZBioztCSM8Li0KgR1w@mail.gmail.com>
Subject: Re: [PATCH v5 2/9] dt-bindings: mmc: amlogic: Add compatible for T7 mmc
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Johannes Berg <johannes@sipsolutions.net>, van Spriel <arend@broadcom.com>, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-wireless@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_053345_038026_1EE69B05 
X-CRM114-Status: GOOD (  12.79  )
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

On Thu, 26 Mar 2026 at 11:01, Ronald Claveau <linux-kernel-dev@aliel.fr> wrote:
>
> Add amlogic,t7-mmc compatible string, falling back to amlogic,meson-axg-mmc
> as the T7 MMC controller is compatible with the AXG implementation.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
> index 57646575a13f8..976f36de2091c 100644
> --- a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
> @@ -19,6 +19,10 @@ allOf:
>  properties:
>    compatible:
>      oneOf:
> +      - items:
> +          - enum:
> +              - amlogic,t7-mmc
> +          - const: amlogic,meson-axg-mmc
>        - const: amlogic,meson-axg-mmc
>        - items:
>            - const: amlogic,meson-gx-mmc
>
> --
> 2.49.0
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
