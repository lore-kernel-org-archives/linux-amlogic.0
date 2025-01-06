Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB520E77188
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Jan 2025 14:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VcJ2ZDbVrIODrZIrh5/qUx/8ZaaxCMb+cjNGsSFEb3k=; b=UMXmzxsyBqZp7h
	K8Ilh343Z1U01OIn1AR5gsSqWNsMK6zQMxLq2haq6oO854yBDhBtJidyUZZy/MOULnkb3e1b1GMIr
	0mRUV4HgK+jZz0GfhGCeXQQ22RfjO2qKci4yn/7lZanQSi3/WzdW4fIwJ91DZX8zamI0RE6e2X9nZ
	uHaHXd1Kwu3iKEkRXyxqnpDH/8bFJeMFYyuOtgAYdDO5S5VQEbBGYNlK8kcTY3QOB7gfL35R2DEDo
	XEIa/Ay5V9Sg34t3PK30kNHZdTn89GcB+B4Lo8BHAtCIXaZSTO9cxmmc3ewIOxlChoC2ITImgoHQD
	gc/QdGd22cXqRd7PDoeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUoPY-00000001dsK-2zpQ;
	Mon, 06 Jan 2025 14:48:56 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUoB9-00000001afV-3Hwc
	for linux-amlogic@lists.infradead.org;
	Mon, 06 Jan 2025 14:34:05 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43618283dedso143742955e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Jan 2025 06:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736174042; x=1736778842; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LJS2rW2T2RcSfQ5iAkA0Gffqe23ezlX4jRnbxIk5ccs=;
        b=trrv+qZunZ0+TmQ/KN4zO3TW13be+dpKPMcb98VUTbINabb7VTT4LdU+0tyhqixw4K
         SmXfnoAeRvQdYAxCP5NWtv8mAm+wwcptJgjWJhxIUZLcfVgHdbEkuQ11o0MHE1Y8/GYl
         k6T05Z01mnzxJATpiwcdDedGTSZOl6uSH/s6NC3kWeMdYrlj/eiaKqfYCfk3tLN0BeEn
         hxRCGwIc3NckNlStw9rUlGDyYwjpHIj+Js6yUtY7SL8+HRQipNZInZFZXzu4dYo6WUCd
         CNYFWQ0fuzrh6V1QaslrgprCg+Q/hBHIvtWx6VDxznL87UR15vA4yAn9rZnCccAa9zph
         7eyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736174042; x=1736778842;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LJS2rW2T2RcSfQ5iAkA0Gffqe23ezlX4jRnbxIk5ccs=;
        b=VI6/RkRbuBXPMMyZN4Fax0UVm/sUGMyHBLxZHUbjLjLEvRdtf8goXnKZ6DwCP/+Zbf
         UXg/eh4O9wBzqmnFycED/CBv13p2oqSzXYPFCf1aIOP6zdnpxhtgebuVfaQhRokOp45Z
         zDR4oum7N4L/6aInHQ+iNneIl66dE4LPl7q+MsYECNrYKN9ffZeTlVlo9TgwSTa230FE
         iGQ2+lffb90hkoMvzTBjYlBVjzzXV9vEtc3ck54/cvANe2WbBSgQ8TVII6T933LRqu9a
         YHOHhBe2Z+zRQSn0H3PfjUZBJDXUsVl5KLm3m1nDYXDrH93iMntNXojolBHZ7OKUU6w9
         YTgw==
X-Forwarded-Encrypted: i=1; AJvYcCU3PzrkxxZp9F5AB9Pl8a+V49TJmG+6j6ImuAEd4ZGaVfOrcWCYPX5f0AJVrlWAK7IQgTRG7fx4cHkrj+s0@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0ltLJNkv4edG2KHgD9OvISdZCxU3qK3DWU/bSoNmfokXXqHsG
	LRyowwevL9Hvvl2z1asx/hmsclsao0JivxcuLjmx/eYwmlRYdG+g8kB48Rivbzk=
X-Gm-Gg: ASbGncs4EmBVfGJ2aHIPl4jJs5497S/RdOR3Feg/2x3W+JUMxqHgAVDHOJVvtH7puOP
	gjwE0010f2NXVNRH4/KUt31NiVCHjbWuplyQYpwIkxD/kMrEfX44ZwveNFcwvqGOYYJ+e2SQS/3
	CfR7uEpx2ZwByclPxTi3Eiyi3lT0MSIpxkQwmk0lxgrCNqqCw/jjlGjVvrb7otxjlYUtS9TJfPR
	cZovEJwOQeAjsg9XmNl9iwYsJL4NSCgJ0/rW/nqQv0A49RT53mLqqu/
X-Google-Smtp-Source: AGHT+IFP7sfF3m4i727Wam1azM0kasnMNja3MbbIcuKtEVEEuVjvrxhTyPP+GTViojdnICts5GSdLA==
X-Received: by 2002:a7b:cd98:0:b0:42c:b9c8:2bb0 with SMTP id 5b1f17b1804b1-4366b2f95c5mr489415105e9.4.1736174042302;
        Mon, 06 Jan 2025 06:34:02 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:2a4a:e041:e2ff:6b41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea40csm569164115e9.1.2025.01.06.06.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 06:34:01 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-sound@vger.kernel.org,  linux-amlogic@lists.infradead.org,
  s.nawrocki@samsung.com,  lgirdwood@gmail.com,  broonie@kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1 2/2] ASoC: dapm: add support for preparing streams
In-Reply-To: <1jy0zo9fu4.fsf@starbuckisacylon.baylibre.com> (Jerome Brunet's
	message of "Mon, 06 Jan 2025 15:28:35 +0100")
References: <20250106141316.375984-1-martin.blumenstingl@googlemail.com>
	<20250106141316.375984-3-martin.blumenstingl@googlemail.com>
	<1jy0zo9fu4.fsf@starbuckisacylon.baylibre.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 06 Jan 2025 15:34:01 +0100
Message-ID: <1jsepw9fl2.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_063403_823271_A94F50EF 
X-CRM114-Status: GOOD (  20.93  )
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

On Mon 06 Jan 2025 at 15:28, Jerome Brunet <jbrunet@baylibre.com> wrote:

> On Mon 06 Jan 2025 at 15:13, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:
>
>> Codec driver can implement .hw_params and/or .prepare from struct
>> snd_soc_dai_ops. For codec-to-codec links only the former (.hw_params)
>> callback has been called.
>>
>> On platforms like Amlogic Meson8/8b/8m2 the SoC's sound card
>> (sound/soc/meson/gx-card.c) uses a codec-to-codec link for the HDMI
>> codec output because further digital routing is required after the
>> backend. The new DRM HDMI (audio) codec framework (which internally
>> uses sound/soc/codecs/hdmi-codec.c) relies on the .prepare callback
>> of the hdmi-codec to be called. Implement a call to
>> snd_soc_dai_prepare() so the .prepare callback of the hdmi-codec is
>> called on those platforms.
>>
>> For platforms or sound cards without a codec-to-codec link with
>> additional parameters (which applies to most hardware) this changes
>> nothing as the .prepare callback is already called via
>> snd_pcm_do_prepare() (as well as dpcm_fe_dai_prepare() and
>> dpcm_be_dai_prepare()) on those.
>>
>> Suggested-by: Jerome Brunet <jbrunet@baylibre.com>
>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>
> Thanks for working on this. Overall it looks good.
>
> Not sure if the call the .prepare() should go at the beginning of
> POST_PMU, as done here, or at the end of PRE_PMU ? 
>
>> ---
>>  sound/soc/soc-dapm.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
>> index 99521c784a9b..ac8eef217dc4 100644
>> --- a/sound/soc/soc-dapm.c
>> +++ b/sound/soc/soc-dapm.c
>> @@ -4013,6 +4013,13 @@ static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
>>  		break;
>>  
>>  	case SND_SOC_DAPM_POST_PMU:
>> +		snd_soc_dapm_widget_for_each_sink_path(w, path) {
>> +			sink = path->sink->priv;
>> +
>> +			snd_soc_dai_prepare(sink, substream);

I initially missed it but I think you should do that on the source path
too

On Amlogic, the cpu side of the link does not have a .prepare() callback
but it would be incorrect to do the codec side only if it did.

>> +			ret = 0;
>> +		}
>> +
>>  		snd_soc_dapm_widget_for_each_sink_path(w, path) {
>>  			sink = path->sink->priv;

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
