Return-Path: <SRS0=R8f+=PG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2FF0C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Oct 2021 07:40:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CA2B60F9D
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Oct 2021 07:40:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3CA2B60F9D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=svSLlSXbckjB7pWHMhZW4NFgQAsR0iV+/g7d+hd9UTI=; b=O2bgM5wgKiEkXzeFFwAEX99wBo
	E81QKGhQ+w6RRtp/Qf34P3SAeWC3Y9us99DwQSNnzYQu5ONDBzZq4tbn1XXmBLzso9sudecTonNkg
	Oe8MRD1PqoGhfRtiBnCOOgh7fsdA6KGw+SZ4jEsESwkb3S3iFW+54We0ksLAyuwgA9cEx50+J0Ose
	xybsEVkrhuvRrCVxdm0ATlF4NgxAq3dGN4VpvYv89CfuUMc/Ptlm5wXOmYdJjWNQJu9fg3KXQai/c
	NKDTGc8Rrs1z/p9pmFHp9Z87uX2TGbq7GFgWef8WGSaiadZrw2JCqE2C1EF61cizMRF12OFwW4qQn
	DG2KJ5sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcNFh-00EUeO-7q; Mon, 18 Oct 2021 07:40:09 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcNFc-00EUca-By
 for linux-amlogic@lists.infradead.org; Mon, 18 Oct 2021 07:40:07 +0000
Received: by mail-wr1-x42b.google.com with SMTP id r18so39573009wrg.6
 for <linux-amlogic@lists.infradead.org>; Mon, 18 Oct 2021 00:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VZmNs2GkzxhCB6JvBYnlodKD9/a6gtDFwX3G4j5wn7c=;
 b=oae7VeX5cuVbu+3yaIg3mCW2czfOxBXemxBlIV/GCmMSn7Aj2S36Cfp2Ej1UN5iZ5R
 n59i410Rso7mM0FYctJy9Qcza9G7OPMt45JKHUkjj6gBXOXrZRQAgeNQpdFKYAcQAEz7
 fH5nbg0HrhbN8+KrPKuJ7HuL25jtsyaBWXOj5r+0BQf3Gm4sPejcfTRk7JOD2IPARhbb
 PTY3ehD/1Hq9lRlRsZFej21R6JCPLFZaC7iMr2NOI1bvdhADA+KQof5JmF3BjK26vzl0
 nElkg51iqJ/x/8vso6C0mKXQNW3QhtimFsVQVB/gyiqi2UTiOrrGhPYGG3J+dq9snEA0
 mlAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=VZmNs2GkzxhCB6JvBYnlodKD9/a6gtDFwX3G4j5wn7c=;
 b=JJ0taR2nWcqPBUgej2/7owgC/9t5OR47REx/j89M/Zni5QIqpbCWXWitnYLRXgxUbl
 1p4n59v24zDJIgilQgAxNT2lVszDFGoAd4vauwzZR+w+chcc88GAXyXTP9rnlt+cezL5
 5hWB8TkvDqwPxRVJPvhon2igqcNpkt2LEh1oKvGBMwZBzui8EYubgSLWRWcPxbhyed+6
 KDGQq0gtKajrpcUzqiWSGUBgtypz8pvlsTEpKtpvd44Qa8fjfteGpSQllpee4rEXyAzZ
 bzRrGvcYb5E9lLAo+uSxmX0HgdnyuCW38ZXmX8bGShDwGxslqf5XxaAtkSy1usz2gzk1
 sEvw==
X-Gm-Message-State: AOAM532R5KZVCs477hXuaNTTeF+u40zwrkZvXSji7SApEK43YwlLHhMh
 P0mdXM3CyKVpkNpXzYS88zl1AA==
X-Google-Smtp-Source: ABdhPJyHqY72fbaXwdf2acp6AUOMOZIy/6NHYEKRPlWsRaHyfSV7hxwz4gN1tq143M0gfexGnALqSQ==
X-Received: by 2002:adf:aad4:: with SMTP id i20mr34082320wrc.402.1634542801469; 
 Mon, 18 Oct 2021 00:40:01 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:2dd7:d5eb:6e87:f924?
 ([2001:861:44c0:66c0:2dd7:d5eb:6e87:f924])
 by smtp.gmail.com with ESMTPSA id z135sm6889997wmc.45.2021.10.18.00.40.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 00:40:00 -0700 (PDT)
Subject: Re: [PATCH v2 6/6] drm/meson: encoder_cvbs: switch to bridge with
 ATTACH_NO_CONNECTOR
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, sam@ravnborg.org
Cc: daniel@ffwll.ch, Laurent.pinchart@ideasonboard.com,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20211015141107.2430800-1-narmstrong@baylibre.com>
 <20211015141107.2430800-7-narmstrong@baylibre.com>
 <CAFBinCBwO0CJMPA3K6e8OxXcinzrA5LrSqaKu1XtZPWLXT8Krw@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <7a921d1d-84b4-c3e4-8f7c-10db5ad42ecf@baylibre.com>
Date: Mon, 18 Oct 2021 09:40:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCBwO0CJMPA3K6e8OxXcinzrA5LrSqaKu1XtZPWLXT8Krw@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_004004_518600_04F2090F 
X-CRM114-Status: GOOD (  18.16  )
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

Hi,

On 16/10/2021 00:34, Martin Blumenstingl wrote:
> Hi Neil, Hi Sam,
> 
> On Fri, Oct 15, 2021 at 4:11 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
> [...]
>> +static const struct drm_bridge_funcs meson_encoder_cvbs_bridge_funcs = {
>> +       .attach = meson_encoder_cvbs_attach,
>> +       .enable = meson_encoder_cvbs_enable,
>> +       .disable = meson_encoder_cvbs_disable,
>> +       .mode_valid = meson_encoder_cvbs_mode_valid,
>> +       .get_modes = meson_encoder_cvbs_get_modes,
>> +       .atomic_enable = meson_encoder_cvbs_atomic_enable,
> I did some testing on boards where u-boot doesn't initialize the video outputs.
> It seems that meson_encoder_cvbs_enable() is never called with this patch.
> meson_encoder_cvbs_atomic_enable() is called though.
> 
> From what I can see in drm_bridge.c [0] this is even expected.
> Does this mean that we need to move all logic from .enable to
> .atomic_enable (and same with .disable -> moving that logic to
> .atomic_disable)?
> 
> The same comment applies to the HDMI patch.

Good point, I'll fix that for both patches !

Neil

> 
> 
> Best regards,
> Martin
> 
> 
> [0] https://elixir.bootlin.com/linux/v5.15-rc5/source/drivers/gpu/drm/drm_bridge.c#L717
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
