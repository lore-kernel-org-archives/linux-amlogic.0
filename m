Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB6EEF54AC7
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Mar 2026 15:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GJ2rTmWxh1RYEBvETCqyrB70zh0knG7TEs+XhECKZTw=; b=OluhLZyz3u9q6B
	W/SPQZ24QTDfaLnQL16YdDcIV9ito3auvBcamlEcVROOHmKdaEgjN0MmhRdk9yq3dxdvRnXTJyMTT
	hp8Hbr1Mric9eHqw+Wc1YrooFxGCHN8FANrrBz2rHYnasI9rgdEPu4eI5bMAa8Bcp2Fr/jK4KSc+k
	IKcggcsKmn2Eifj5JxahUfdiSIG5bIa6jyhZDlE2CX6kt+FqeJVWrW76rTdDfuYBt8w1dkgheTcSW
	Sc0omMX0dRxQ0KYoLZSQfrNRTwki10IYlr4JLDhxBKiY5dblo9j8OptMldl8WCKQ8URSU+wKkuv5A
	NVKz5HmszVyEh6/trhsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w53J0-00000001iHK-49es;
	Tue, 24 Mar 2026 15:04:30 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w53Iy-00000001iGB-0Rq2
	for linux-amlogic@lists.infradead.org;
	Tue, 24 Mar 2026 15:04:29 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5a297a69089so740206e87.1
        for <linux-amlogic@lists.infradead.org>; Tue, 24 Mar 2026 08:04:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774364666; cv=none;
        d=google.com; s=arc-20240605;
        b=WZn8HA8wnIIDq+WwbcEQNr+x7mfG+ir/bXBgavpke9gyxntuGJLV9Kms77wHB3AtPW
         r2YFX3x2+/14tHcY9Ue0dtA9OxPK0j1uA6Mt7GnVTCcYAzzqkCKOxUUbUeZjOWa50l6Y
         1wkG7gQPY2cyIKF56tkudPH0hwmpEBsH6k63X3Ru76bW8Ne5Ud9gmZxIMFid45y7aWA5
         JiHPpkaZYWni6cZGn1EBxSTtJ14WOmHnT/IcVfgzmgtVHuBkKGlmQ9Cec7rzWO3CGi4n
         NmDb6igvGFp5SiAbrv6k0MwhVOuJchRDm6pKuOqSEcCeOvwqaVmdlE+ovrnJ3sgzL0aN
         8ubg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AjCxn1Cse5cZLsfMqwS6O3xXKU9LhII7wm0gPZuu+cg=;
        fh=tBJSaaOaH4kr8OCew+ubYTCT+psG9KKyTG3bnOLhMGI=;
        b=XcMchrtgZVoqGLttHv63Zxp3fQVoSkaC9lkmtlMXd+5yIeBpkbJ+db3AQ8eVcFXhj7
         ndOGWMLp9lsO6NmIyx54aa+s3rkAuHvFl94dQ7bGTlbOP4wAHEBnyLOQoK7xVVaPyYg0
         ahxxUojdZmtqtiVrNR5l12G75K7hrtUPywfcc8EOeDd+cO0v69OW5Bpdt9nOH1BzEI+U
         dd2n2fj1a/ArgifomgIqezmpsvvuUd0LppWToBHBI1h3mZtuUfXg3UwOG/39UbYdxz1D
         uR7VJ8m5eabjvKWGg318zF00QWn8ZYna6xhREj8W4JhUFvS9lsgcn+49Cb0Mb1SdnymF
         OiaA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774364666; x=1774969466; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AjCxn1Cse5cZLsfMqwS6O3xXKU9LhII7wm0gPZuu+cg=;
        b=eRyCaCdswUs+rXgNLnqmq2SkKbC4LLcqbxQFDaws+GXBvF2CGzMQJ0lBkknCPy1kPl
         4q1m+EaI0/Tp+ssUNKMWdfeZNcJ4MuNhk2RmzsnWGbp8FTZZaZArz1Pq/zFxHGjEEA0T
         dxZKauwSZfXwN8wVmXo9ErtYEp/jvQEKAA500gisAZAFFNOXVXBeWRAAesPq0zdUZAEf
         J0/gBUnblGjy3a5JCwmsHRPvJ4vOxxI6LK7ecl4VrqxwQm7idvKi0hF4XBCRLM5vZz3C
         65kU8QNLbf31njKC1EZtK5Vl6F90AMqr1BlJ5MC4yN6WecWZz6N307s5CaFSilRUqMPU
         Giyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774364666; x=1774969466;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AjCxn1Cse5cZLsfMqwS6O3xXKU9LhII7wm0gPZuu+cg=;
        b=fDxzSDltbjZ0zGZjQi5pcCkB+feBDDk8N/0+3GICidrp/ByPGNNQEab48rv+4O/aCS
         FMvd+BWRtob9oTO+A9Yd+di2kK+aj+W3vTln81CawF6x6JWOmt1bwfLWKHaomHCQWKs7
         dsC6OwLtzc08Fu7Jl2FgadTPBpchEgaj8T3aMJ+1emEcI13C9xbRAr1uW7ay3kwt+bxv
         WJdbzJSwJaM5WEfTp0W8PGoiQSNVZF4QC/z+WN6QV5YN7lw/FYf3u/zVzRuAOpBTeakU
         AyLgmM8Vt05UnmYeg7Phv0eszw5YlJlOaItSElu0bDSPTGcKvN5dVLfGLRa4U/YKT+Km
         A80Q==
X-Forwarded-Encrypted: i=1; AJvYcCUBoGzM/BCvKOaaZimHxz+aHfX+HShcRoUO6LPugpgfzCTuIUTFB0TcErNc8nUVj7u7BD7XFAKS7vVlFgpC@lists.infradead.org
X-Gm-Message-State: AOJu0YxhLL/syrprmG5of/2ZRALfdYRAq+7D73ZR3F2xWHpKSWAhejpa
	ntBC9XUXN7vqHWnfbCfgqNizeJezoQR9HHMFX7h0TY80xEByWWmNlQuGl+f/LQjQllthicDt2e/
	XtG6Kc7DMAZ0Wo4wZleP2DAisE7p5O297w4wWjNyixA==
X-Gm-Gg: ATEYQzxt8KYGBgK3PEGZILA0+WKMwV+1r/WSPZSYT9e2s8O9abGRGbsbq5N/HHeno9O
	5R/p0CTWvMR1hNHsBmK5swbqXQxkimXGI1EGDEH08zLcXZlM7KxK56ISX6i9Tp5WiPtRlSPz3aK
	HoYYYef6TDF2Vdz6XBU861MhoZGkv0rTX0tgJ6Z8gtg9NfUtSnXRubMcb1Mj+Ix34S8ul6sj24+
	9+PjGDEBPyy/QxVzA/DpWDsc00N7vAilAs/oEMzGw25GS2rF90moL/1Je57CU9GER89q0i4Kt1G
	7fw4tbU3
X-Received: by 2002:a05:6512:318b:b0:5a1:27b1:1e0b with SMTP id
 2adb3069b0e04-5a285b5879dmr5609526e87.38.1774364665808; Tue, 24 Mar 2026
 08:04:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260323-add-emmc-t7-vim4-v3-0-5159d90a984c@aliel.fr> <20260323-add-emmc-t7-vim4-v3-2-5159d90a984c@aliel.fr>
In-Reply-To: <20260323-add-emmc-t7-vim4-v3-2-5159d90a984c@aliel.fr>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 24 Mar 2026 16:03:49 +0100
X-Gm-Features: AQROBzCPIbxWE8u1Ho5blhjIXaA43rjAdkegBcTuKwhyIBqFQ-RWFD1-u62lLKw
Message-ID: <CAPDyKFr5VHukeBE4Z1kVe-hUCFUCrw5roP=hT5jQC5b2X2fENA@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] dt-bindings: mmc: amlogic: Add compatible for T7 mmc
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Johannes Berg <johannes@sipsolutions.net>, van Spriel <arend@broadcom.com>, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-wireless@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_080428_171395_AD2C4600 
X-CRM114-Status: GOOD (  14.16  )
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

On Mon, 23 Mar 2026 at 10:58, Ronald Claveau <linux-kernel-dev@aliel.fr> wrote:
>
> Add amlogic,t7-mmc compatible string, falling back to amlogic,meson-axg-mmc
> as the T7 MMC controller is compatible with the AXG implementation.
>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
> index 57646575a13f8..40dccf9715781 100644
> --- a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
> @@ -19,7 +19,10 @@ allOf:
>  properties:
>    compatible:
>      oneOf:
> -      - const: amlogic,meson-axg-mmc
> +      - items:
> +          - enum:
> +              - amlogic,t7-mmc
> +          - const: amlogic,meson-axg-mmc
>        - items:
>            - const: amlogic,meson-gx-mmc
>            - const: amlogic,meson-gxbb-mmc
>
> --
> 2.49.0
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
