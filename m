Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A598CC25B08
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Aug 2022 08:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bJjR3UOAJnTtr6oYXax1iETcEavgcjpoqxhH5p1UkY8=; b=dss11GVU5pNcwu
	RU5RuU7pYZgiPbs9USj9wylJCUAv7OirTMR32Fy9t44/9fKu1ncXpP0oyddPrEX6gpTDHfKZu8BoY
	qi2dMYppq/AGy7WoKLOZKJ3XX9JlhDFS1jFI8C01h6zVZLAwSNrUku2kYRO2ctC7P+0xd9IYl6iUo
	DM3L3ekzK8pcsE7v5yXu2TSCTPc0MZelkRX30zixxEqsd4eZjYuVzMzHK3dIyIOERbeTcBtT2cM6h
	nu13c/D/g1RUPkJL2YTM37M3yjo61WFMT+l5BGA7/vB2LHgrFPKajlPmSfA9bDttyiONma7wKc70/
	F3DTu432g0c/zxeIhN/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOEmt-00FlzX-E4; Wed, 17 Aug 2022 08:52:31 +0000
Received: from mail-qt1-f178.google.com ([209.85.160.178])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOEma-00Fl9G-JC; Wed, 17 Aug 2022 08:52:14 +0000
Received: by mail-qt1-f178.google.com with SMTP id w28so9910079qtc.7;
        Wed, 17 Aug 2022 01:52:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=2JD+X/GOYgljDqW3V4/txiGVTXdbLlGZCC1UfMUdTQc=;
        b=eBtNwSHquj6AfTuz9UnFK5fuOAeTpI3/DML4BfVBbONOD9w2Cqvi8Iu674WvBpGtsk
         QAjGuDAaTRn67dbhFTyz2A3Hm/PIdibjvX3h+mca51N7XRXGhG/aqUTHYgGUyKqOEN3/
         vuyX6knf4QyWN8BRtBRsLLu+T4Vaow4DLcs5dopf3+9un+HHVpRNyZpLc4bqY9haGMo1
         weDcdsER+V0vjQqDye5gWidwKSwfpPdg574YT+Vvi66LWTW7wg+aAl7S5fpc5NnHPmDh
         qf6WkZh01AJkn/e9o1MXY4CKRscPrN/7RmdSJGBrbXwseyuQ/uHbcK+UFjuYXZCwGcTW
         G8Yg==
X-Gm-Message-State: ACgBeo0PJS/QEe7mLwwJuhubm+Pxs8kIFK3qXz3BsJ/YaMAPCY87PP0b
	ClKFPnLNJ4+GVlaOG9d+r5xtQEIiBt7aQw==
X-Google-Smtp-Source: AA6agR7QlpJipLMZhIExQT/icSEoWHxFb5PIybpLM/cdyo+vxUltdt7qQGpj8NxamR0nLB8BdInYLA==
X-Received: by 2002:a05:622a:199c:b0:344:7645:9ba1 with SMTP id u28-20020a05622a199c00b0034476459ba1mr5234289qtc.629.1660726328232;
        Wed, 17 Aug 2022 01:52:08 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id h5-20020a05620a400500b006b615cd8c13sm13941972qko.106.2022.08.17.01.52.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Aug 2022 01:52:07 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-31f445bd486so214402957b3.13;
        Wed, 17 Aug 2022 01:52:07 -0700 (PDT)
X-Received: by 2002:a25:880f:0:b0:67c:2727:7e3c with SMTP id
 c15-20020a25880f000000b0067c27277e3cmr18847109ybl.36.1660726327196; Wed, 17
 Aug 2022 01:52:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-4-3d53ae722097@cerno.tech>
 <CAMuHMdUrwzPYjA0wdR7ADj5Ov6+m03JbnY8fBYzRYyWDuNm5=g@mail.gmail.com>
 <20220816132636.3tmwqmrox64pu3lt@houat> <CAMuHMdUNLPbjs=usYQBim5FxsrC1oJLuF+3JB7auzHHRoOqavQ@mail.gmail.com>
 <20220817075351.4xpsqdngjgtiqvob@houat>
In-Reply-To: <20220817075351.4xpsqdngjgtiqvob@houat>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Aug 2022 10:51:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUusnhYodWGCxJBu-1Hd2KW-xdT8jxE_iVdQjDo8b3Y5Q@mail.gmail.com>
Message-ID: <CAMuHMdUusnhYodWGCxJBu-1Hd2KW-xdT8jxE_iVdQjDo8b3Y5Q@mail.gmail.com>
Subject: Re: [PATCH v1 04/35] drm/modes: Introduce 480i and 576i modes
To: Maxime Ripard <maxime@cerno.tech>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jerome Brunet <jbrunet@baylibre.com>, 
	Samuel Holland <samuel@sholland.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, 
	Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, 
	linux-sunxi@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Phil Elwell <phil@raspberrypi.com>, 
	Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
	DRI Development <dri-devel@lists.freedesktop.org>, Dom Cobley <dom@raspberrypi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_015212_707962_7382FAE5 
X-CRM114-Status: GOOD (  44.97  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgTWF4aW1lLAoKT24gV2VkLCBBdWcgMTcsIDIwMjIgYXQgOTo1NCBBTSBNYXhpbWUgUmlwYXJk
IDxtYXhpbWVAY2Vybm8udGVjaD4gd3JvdGU6Cj4gT24gVHVlLCBBdWcgMTYsIDIwMjIgYXQgMDU6
MDA6MzhQTSArMDIwMCwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+ID4gT24gVHVlLCBBdWcg
MTYsIDIwMjIgYXQgMzoyNiBQTSBNYXhpbWUgUmlwYXJkIDxtYXhpbWVAY2Vybm8udGVjaD4gd3Jv
dGU6Cj4gPiA+IE9uIEZyaSwgQXVnIDEyLCAyMDIyIGF0IDAzOjE4OjU4UE0gKzAyMDAsIEdlZXJ0
IFV5dHRlcmhvZXZlbiB3cm90ZToKPiA+ID4gPiBPbiBGcmksIEp1bCAyOSwgMjAyMiBhdCA2OjM1
IFBNIE1heGltZSBSaXBhcmQgPG1heGltZUBjZXJuby50ZWNoPiB3cm90ZToKPiA+ID4gPiA+IE11
bHRpcGxlIGRyaXZlcnMgKG1lc29uLCB2YzQpIGRlZmluZSB0aGUgYW5hbG9nIFRWIDUyNS1saW5l
cyBhbmQgNjI1LWxpbmVzCj4gPiA+ID4gPiBtb2RlcyBpbiB0aGUgZHJpdmVycy4KPiA+ID4gPgo+
ID4gPiA+IE5pdDogc3RyaWN0bHkgc3BlYWtpbmcgdGhlc2UgYXJlIG5vdCBhbmFsb2cgbW9kZXMs
IGJ1dCB0aGUgZGlnaXRhbAo+ID4gPiA+IHZhcmlhbnRzIChJVFUtUiBCVC42NTYgYW5kIERWRC1W
aWRlbyBEMSkgb2YgTlRTQyBhbmQgUEFMLCB1c2luZyBhCj4gPiA+ID4gMTMuNSBNSHogc2FtcGxp
bmcgZnJlcXVlbmN5IGZvciBwaXhlbHMuCj4gPiA+ID4KPiA+ID4gPiBJbiBhbmFsb2cgbW9kZXMs
IHRoZSBvbmx5IGRpc2NyZXRlIHZhbHVlcyBhcmUgdGhlIG51bWJlciBvZiBsaW5lcywgYW5kCj4g
PiA+ID4gdGhlIGZyYW1lL2ZpZWxkIHJhdGUgKGZpeGluZyB0aGUgaG9yaXpvbnRhbCBzeW5jIHJh
dGUgd2hlbiBjb21iaW5lZCkuCj4gPiA+ID4KPiA+ID4gPiBUaGUgbnVtYmVyIG9mIChpbil2aXNp
YmxlIHBpeGVscyBwZXIgbGluZSBkZXBlbmRzIG9uIHRoZSBhdmFpbGFibGUKPiA+ID4gPiBiYW5k
d2lkdGguICBJbiBhIGRpZ2l0YWwgdmFyaWFudCAod2hpY2ggaXMgYW55dGhpbmcgZ2VuZXJhdGVk
IGJ5IGEKPiA+ID4gPiBkaWdpdGFsIGNvbXB1dGVyIHN5c3RlbSksIHRoZSBsYXR0ZXIgZGVwZW5k
cyBvbiB0aGUgcGl4ZWwgY2xvY2ssIHdoaWNoCj4gPiA+ID4gY2FuIHdpbGRseSBkaWZmZXIgZnJv
bSB0aGUgMTMuNSBNSHogdXNlZCBpbiB0aGUgQlQuNjU2IHN0YW5kYXJkLiAoZS5nLgo+ID4gPiA+
IEFtaWdhIHVzZXMgNy4wOS8xNC4xOS8yOC4zOCBNSHogKFBBTCkgb3IgNy4xNi8xNC4zMi8yOC42
NCBNSHogKE5UU0MpKS4KPiA+ID4gPgo+ID4gPiA+IFNvIEkgdGhpbmsgd2UgcHJvYmFibHkgbmVl
ZCBzb21lIHdheSB0byBnZW5lcmF0ZSBhIFBBTC9OVFNDLWNvbXBhdGlibGUKPiA+ID4gPiBtb2Rl
IGJhc2VkIG5vdCBvbmx5IG9uIHJlc29sdXRpb24sIGJ1dCBhbHNvIG9uIHBpeGVsIGNsb2NrLgo+
ID4gPgo+ID4gPiBUaGlzIHdvdWxkIGFsc28gZml4IHRoZSBjb21tZW50cyBtYWRlIGJ5IEphbmkg
YW5kIFRob21hcywgc28gSSBxdWl0ZQo+ID4gPiBsaWtlIHRoZSBpZGVhIG9mIGl0Lgo+ID4gPgo+
ID4gPiBJJ20gc3RydWdnbGluZyBhIGJpdCB0byBmaW5kIGhvdyB3b3VsZCBjb3VsZCBpbXBsZW1l
bnQgdGhpcyB0aG91Z2guCj4gPiA+Cj4gPiA+IEZyb20gd2hhdCB5b3Ugd2VyZSBzYXlpbmcsIEkg
Z3Vlc3MgdGhlIHByb3RvdHlwZSB3b3VsZCBiZSBzb21ldGhpbmcgbGlrZQo+ID4gPgo+ID4gPiBz
dHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqZHJtX2NyZWF0ZV9hbmFsb2dfbW9kZSh1bnNpZ25lZCBp
bnQgcGl4ZWxfY2xvY2ssCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHVuc2lnbmVkIGludCBsaW5lcywKPiA+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGZyYW1lX3JhdGUpCj4g
PiA+Cj4gPiA+IEJ1dCBJIGhhdmUgemVybyBpZGVhIG9uIHdoYXQgdGhlIGltcGxlbWVudGF0aW9u
IHdvdWxkIGJlLiBEbyB5b3UgaGF2ZQo+ID4gPiBzb21lIHJlc291cmNlcyBmb3IgdGhpcyB5b3Ug
Y291bGQgcG9pbnQgbWUgdG8/Cj4gPgo+ID4gSG9yaXpvbnRhbGx5LCBJIHRoaW5rIHlvdSBzaG91
bGQgY2FsY3VsYXRlIGxlZnQvcmlnaHQgbWFyZ2lucyBhbmQKPiA+IGhzeW5jIGxlbmd0aCB0byB5
aWVsZCB0aW1pbmdzIHRoYXQgbWF0Y2ggdGhvc2UgZm9yIHRoZSBCVC42NTYgUEFML05UU0MKPiA+
IG1vZGVzLiAgSS5lLiB3aGVuIGEgNjQweDUxMiBtb2RlIHdpdGggYSBwaXhlbCBjbG9jayBvZiAx
NCBNSHogaXMKPiA+IHJlcXVlc3RlZCwgeW91IHdhbnQgdG8gY2FsY3VsYXRlIGxlZnQnLCByaWdo
dCcsIGFuZCBoc2xlbicgZm9yCj4gPgo+ID4gfCA8LS0tLSBsZWZ0JyAtLS0+IHwgPC0gNjQwIHBp
eGVscyAtPiB8IDwtLS0tIHJpZ2h0JyAtLS0+IHwgPC0tLSBoc2xlbicgLS0+IHwKPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgIEAgMTQgTUh6Cj4gPgo+ID4gc28gdGhleSBtYXRjaCB0aGUgdGlt
aW5ncyBmb3IgbGVmdCwgcmlnaHQsIGFuZCBoc2xlbiBmb3IKPiA+Cj4gPiB8IDwtLS0gbGVmdCAt
LS0+IHwgPC0tLSA3MjAgcGl4ZWxzIC0tLT4gfCA8LS0tIHJpZ2h0IC0tLT4gfCA8LS0tIGhzbGVu
IC0tLT4gfAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgQCAxMy41IE1Iego+ID4KPiA+IEFz
IDY0MCBwaXhlbHMgQCAxNCBNSHogYXJlIGxlc3Mgd2lkZSB0aGFuIDcyMCBwaXhlbHMgQCAxMy41
IE1IeiwKPiA+IHlvdSB3YW50IHRvIG1ha2Ugc3VyZSB0byBhbGlnbiB0aGUgY2VudGVyIG9mIHRo
ZSB2aXNpYmxlIHBhcnQuCj4KPiBTbyBJIGd1ZXNzIGluIHRoYXQgZXhhbXBsZSBpZiB3ZSB3YW50
IHRvIGNlbnRlciBpdCwgbGVmdCA9PSByaWdodCBhbmQKPiBsZWZ0JyA9PSByaWdodCc/IFdoYXQg
YWJvdXQgdGhlIHN5bmMgbGVuZ3RoPwoKTm8sIGxlZnQgYW5kIHJpZ2h0IGFyZSBhc3ltbWV0cmlj
YWwsIGNmci4gZnJvbnQgYW5kIGJhY2sgcG9yY2ggaW4KaHR0cHM6Ly9lbi53aWtpcGVkaWEub3Jn
L3dpa2kvUEFMI1BBTF9zaWduYWxfZGV0YWlscwpJLmUuIGlmIHRoZSBwaXhlbCBwYXJ0IGlzIHJl
ZHVjZWQsIGJvdGggdGhlIGxlZnQgYW5kIHJpZ2h0IG1hcmdpbnMKc2hvdWxkIGJlIGluY3JlYXNl
ZCBieSB0aGUgc2FtZSBhbW91bnQuCgpGcm9tIHRoZSB0YWJsZSBsaW5rZWQgYWJvdmUsIGhzbGVu
IHNob3VsZCBiZSBjYS4gNC43wrVzIChmaXhlZCkuCgo+ID4gVmVydGljYWxseSwgaXQncyBzaW1w
bGVyLCBhcyB0aGUgbnVtYmVyIG9mIGxpbmVzIGlzIGRpc2NyZXRlLgo+ID4gWW91IGRvIGhhdmUg
dG8gdGFrZSBpbnRvIGFjY291bnQgaW50ZXJsYWNlIGFuZCBkb3VibGVzY2FuLCBhbmQKPiA+IHBy
b2dyZXNzaXZlIG1vZGVzIHdpdGggMjYyLzMxMiBsaW5lcy4KPgo+IFNvIHdlIG9ubHkgaGF2ZSB0
byBkZWFsIHdpdGggNTI1IGFuZCA2MjUgbGluZXMgdG90YWwgKHdpdGhvdXQgdGFraW5nCj4gaW50
ZXJsYWNlIGFuZCBkb3VibGVzY2FuIGludG8gYWNjb3VudCksIHJpZ2h0PwoKWWVzLgoKPiBJIGd1
ZXNzIHdlIHN0aWxsIGhhdmUgdGhlIHNhbWUgcXVlc3Rpb24sIHdlIHByb2JhYmx5IHdhbnQgdG8g
Y2VudGVyIGl0LAo+IHNvIHRvcCA9PSBib3R0b20sIGJ1dCB3aGF0IGFib3V0IHRoZSB2c3luYyBs
ZW5ndGg/CgpVbmZvcnR1bmF0ZWx5IHRoYXQgdGFibGUgZG9lcyBub3QgbWVudGlvbiB0b3AgYW5k
IGJvdHRvbSBtYXJnaW5zLgpCdXQgYWNjb3JkaW5nIHRvIGRyaXZlcnMvdmlkZW8vZmJkZXYvYW1p
ZmIuYyAoc2VlIHRoZSAiQnJvYWRjYXN0CnZpZGVvIHRpbWluZ3MiIGNvbW1lbnQgYmxvY2sgYW5k
IHRoZSBkZWZpbml0aW9ucyBvZiB0aGUgIm50c2MtbGFjZSIKYW5kICJwYWwtbGFjZSIgdmlkZW8g
bW9kZXMpLCB0aGV5IGFyZSBhc3ltbWV0cmljYWwsIHRvby4KClZzeW5jIGxlbmd0aCBpcyAwLjU3
Nm1zLCBzbyB0aGF0J3MgOSBzY2FuIGxpbmVzIChJIGd1ZXNzIEkgZGlkbid0CmhhdmUgdGhhdCBp
bmZvIHdoZW4gSSB3cm90ZSBhbWlmYiwgYXMgSSB1c2VkIDQgbGluZXMgdGhlcmUpLgoKR3J7b2V0
amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0KR2VlcnQgVXl0
dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBs
aW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBw
ZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpv
dXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQu
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
