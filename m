Return-Path: <SRS0=BQut=RS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8452AC43381
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2019 21:51:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 514352085A
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2019 21:51:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t3UJZyhv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="geIRKggf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 514352085A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J04VlaO8O89bTFko7+o4NkDmDLsnAUqmqQb0jW1UPfA=; b=t3UJZyhvVRBgcv
	OFBTPOk77YWUBT6UVneK22xht/Kh1JK+tW6ApTqdssKehNh7eu4n8RvKGo+9hTh9tvylUYTLYsdpH
	L8bHcToVzlPeBNV8nBKV+Dza1aTphMeM+XjwNgKt4Oc6fbrY64A7glSpIZY7NqwIAVGhyllE687/S
	/8aKu1NuZjqdkE8HEdsyrDZlHs80UoE2QQQ73StLtv79fbp79RjpLEYyz/czKQZhrRiLvnxFwsVIX
	XcrVEuDNcy1ZvFRMNqEMwDgWeyah3M+I8utINBIvAkfbpSrLk4lFyThshXlTTp1FxfHa1i6OMpGIF
	A/t7GjjBBZdG+5i0brwA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4ujA-00039O-5U; Fri, 15 Mar 2019 21:50:56 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4uj8-00038v-56; Fri, 15 Mar 2019 21:50:54 +0000
Received: by mail-oi1-x244.google.com with SMTP id i21so5164067oib.11;
 Fri, 15 Mar 2019 14:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fAnAF6HI3aUDD5hCiUpTX0j0x3eGnc7Pur10ZCisk20=;
 b=geIRKggfZzDk1gKV1yiRf9uxdpZfiq+NAgioXghsD/rMm1SN5ZciBAA+2n7eZg+UlG
 tSlc7eFxqn2H/6FQ601kEgo9o4UcWSL9CUHOHVB1j0Nax33joXTkTh4JI5xO8pdQw1WH
 212w+2r5PcP+e+5Pmey+XnjpPtME9ah9tEV6grfVPPC1C9CHGtGEKsdFklOSW5znxQHI
 vVQB1HyW/qPI+TLIpEIddeFfvfDukVQeL3kDEi4eYr7DRPtbF9n3VIRYP1wg2xSCZ+xX
 bl0eigm4ZS8AAKlXUl1w9/xq4bj0/qUDb/C6vmuLmZwJb3h37imGSe+4AInSpEz4PE/m
 2kfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fAnAF6HI3aUDD5hCiUpTX0j0x3eGnc7Pur10ZCisk20=;
 b=T6rOQCBwEoXFZ9r/rk5fB1kFwGD/g2y6VCsmlpYEF4C4orilHMa4s3aExHSdaWlY+p
 xcZyTgqbO8vtwZTBfmdb/6SWSv521NQ9unh0JyVCAQxAlT4fkFvG4tTluiTiNrrmxxWx
 MwsSuEjERXeEhnT03xPPLsoUpUaGKuM2lr4I+Isa+zE9adxhE6dxPOP30S6BL2SV0C9l
 1G6mr0US2ABUtL0DTwNoyoVpSmbZ34TRPPWWg7t2NMDEHVX+TodBgVUBFXQVTHEpcUoC
 hDZx+/xfFpBEK3X4pJLIR8tfjIJ7Dt+yc5E37C4x2bmF/obp83BNWR4jRb1hEwumPNjm
 SVVA==
X-Gm-Message-State: APjAAAWrUQpL+28z3vZKdRQie6XA7rrk6j6dLBmGUSVzURrp8M2M+lrE
 19+5Ag9Jx5R2bdQN/L+Wm/kCKn0d07bNyCuQvA8=
X-Google-Smtp-Source: APXvYqyK1bhGjvLCx7Kz+icQDppn/ZFSuYO3hrEsaGl494Kl4LmJW4cJFPmz62Oxy+/z506cTjz0/QZ66lavb9dCU+4=
X-Received: by 2002:a54:4e02:: with SMTP id a2mr3085565oiy.140.1552686653469; 
 Fri, 15 Mar 2019 14:50:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190311095613.11371-1-narmstrong@baylibre.com>
 <20190311095613.11371-12-narmstrong@baylibre.com>
In-Reply-To: <20190311095613.11371-12-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 15 Mar 2019 22:50:42 +0100
Message-ID: <CAFBinCDU_6JEJJS8yZkq0rjbqKcy2eBKFaYqgX3txGMiO5U9Fg@mail.gmail.com>
Subject: Re: [PATCH 11/11] arm64: dts: meson-g12a-x96-max: Enable USB
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190315_145054_198352_08546647 
X-CRM114-Status: UNSURE (   6.92  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Mon, Mar 11, 2019 at 10:58 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
[...]
> +&dwc2 {
> +       status = "okay";
> +};
your patch description states that this enables the "USB host ports"
but dwc2 is only used for peripheral mode (meaning: dr_mode =
"peripheral" or dr_mode = "otg").
do we still need to enable dwc2 in a host-only configuration?


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
