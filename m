Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2061BCD8CB9
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Jun 2026 13:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=63Yw5tFI5wmgBA3RyUV0wqxYBoD19uji39PfE63CtiM=; b=fHkF/xdIOqyGQQ
	vO24GLeE+NSQSkgCH3ThXKY3YdAhylqexQHSRmjs7/WWEaWe54I/Qb3dlf1jIuH4XhSyWrVPVO1Nv
	Ju1XPT5aMYkZqf/WQ/N+4GOO4nALE/5Nj+dAgngYO3GY4zxQ0aKnHL66pW6HrqtTJ0oU6U/xiV53h
	cGQtx/5cJlc3mhjC63NjcsiqAed/ZLFzQ9LUNWT+zWVukBlChj7FzW3pJD2JqFaz8KIKqxGfr46tv
	dLrn4mBeEoivATb27Rc9dDogUW7PwNfTsSfADB148waPkCV3nEsbnFyC9p/EkNfhWPSRXAQ3h1jNF
	F/yUzhaC/HPN6sWIu8ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXIyK-00000007mFm-06G1;
	Wed, 10 Jun 2026 13:27:56 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXIyH-00000007mEk-0TEr
	for linux-amlogic@lists.infradead.org;
	Wed, 10 Jun 2026 13:27:54 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-45ef5146b56so4972066f8f.0
        for <linux-amlogic@lists.infradead.org>; Wed, 10 Jun 2026 06:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781098071; x=1781702871; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Dg/fQKFRKiQFhT9w/Pj60e36nurv4DmYNa63cuyXbQ=;
        b=Ij40Mum91ArJmAKd1qQWIakdq063WO4KV3ZhAtOgL4RPn0QSCvIxL4eE5Qj6uaz1DG
         hejjWYFEsdURxrtwr54sIZdBJakQio65bk7cXMkMy0MDGK3wvLB45jgzEjEReJnNxl5X
         roQ0+dkD6zh3kk9gz8FzBeKaK3Kxf6A814CyR7dNy17upfeWh/89KKRAWMk0wDs+KnIc
         e5sMf22TUEiOA8HPuc/A3GIfnUmdF7WlZCNl1E8EiNMVVvxhOEBBg5em8s9kCG8UAFPL
         c5V/PcfRfhYGlx6W3w5PRsnBoR71xkKYrw0WpBady/Qz+V3yHcbB1CZqsv/S13dBsp2W
         hlow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781098071; x=1781702871;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Dg/fQKFRKiQFhT9w/Pj60e36nurv4DmYNa63cuyXbQ=;
        b=pgmweo2culIDoryhNU3uMAAuGhB0TLt+ATQZR8KyxdvJTA027MmQ76s+MTN0yCl+3u
         RrA0zK/TlFo+WUw1Hh6lK3MRJZPhn7bcy2LlJSE2xwjLvjp+qrQb+BhZevFcu2xyQvA/
         uTcBogTD7kCSZ1hwLwDOl+xyJcSOgc4uM1SljonPB5rsGHIGok5r9ZhJWp8959BLZvKn
         gG4LnPMvp+wHXSb7X4ai1G2OOIOmBoyFMJTusG8y/hwo2Dk9hT6xJf+iZYd9eUzsiQDc
         PP6nZoi556Bb3Czjg+qK9Zrrmn8dXQTA3BBCHMigEirOJ2iEi7HOm/NKesq68gqSgURG
         fuMQ==
X-Forwarded-Encrypted: i=1; AFNElJ+wEuYEzOW4H0frmguIsua1EhuIAV/Ng9cs7ZP3VmibaLllnlE0RRepF3TIU5qjb7RyQACdYH5McxBjocWv@lists.infradead.org
X-Gm-Message-State: AOJu0YwY0wlH7ykdaMhvH5Zj6VBAkzZJYwq5WJkT5olLcwfGxRAD8Ybc
	0TP1cCpI/nySNpovAlkTwBUxRtSfYhW3aizAVmWL/9LfojWG+CqT8MmWo+rlMRZf+wU=
X-Gm-Gg: Acq92OFf1Cxy3eUFKU/7oyR0eIBK76LlWpXEDoVQZjqfxO2o8eipjyp6KAN14JH+fW7
	XcQMTAugYbc5EVCNClDf/r82DPbh0X9SzQP1+XrN99acfqPzXvuyPO0P2N7wtfswxnrDht0YoF4
	yPrJRd5ub6YhyTBkvgdBJLnvYtcsD3FCSgjDpjoB2tPPl1YE5uIMxgIhstuJAHLGPvLjPbZYGuj
	sNvv2KMkgciNZXTEk5UfWDaw7GPtVoX9Tx4b+KBVeik3pTqlMpYIkTsUa6C0tFXUm8zHMYx2Qne
	xvFi+3eMwtztTvsiSwLCV8xiJ5R1buuryt134JiQvuQx6Qy62XPiAYRA5kubaj119Zj/iK2oXOm
	MYHp8PlH7EfVURKAoTVgvPlOY9lYZp+p4fxjame1yPGMmOM0yyiJGSb5NnNFb8XvP42ZveBPkYB
	uHww76UXNiK1eBZaTZQn7H2hGUelSA2qzI
X-Received: by 2002:a05:6000:400e:b0:460:18cf:d49b with SMTP id ffacd0b85a97d-46032dabbc0mr33050153f8f.15.1781098071144;
        Wed, 10 Jun 2026 06:27:51 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:c371:18ed:9599:7f5f])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4601f2eadefsm74272179f8f.11.2026.06.10.06.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 06:27:50 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Valerio Setti <vsetti@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,  Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-kernel@vger.kernel.org,  linux-sound@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-amlogic@lists.infradead.org,
  Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 4/4] ASoC: meson: aiu: use aiu-formatter-i2s to format
 I2S output data
In-Reply-To: <a5aa2965-3651-4927-acff-51eee2e4ab4a@baylibre.com> (Valerio
	Setti's message of "Thu, 28 May 2026 17:01:59 +0200")
References: <20260515-reshape-aiu-as-axg-v1-0-53b457784ff3@baylibre.com>
	<20260515-reshape-aiu-as-axg-v1-4-53b457784ff3@baylibre.com>
	<758a4ef9-1a3e-475a-ae1e-83523330d006@sirena.org.uk>
	<891be10c-99f1-45b7-bd31-ec5080cfc780@baylibre.com>
	<a5aa2965-3651-4927-acff-51eee2e4ab4a@baylibre.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 10 Jun 2026 15:27:48 +0200
Message-ID: <1jtsraed9n.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_062753_176956_3994BDB9 
X-CRM114-Status: GOOD (  33.24  )
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

T24gamV1LiAyOCBtYWkgMjAyNiBhdCAxNzowMSwgVmFsZXJpbyBTZXR0aSA8dnNldHRpQGJheWxp
YnJlLmNvbT4gd3JvdGU6Cgo+IE9uIDUvMjIvMjYgMTg6MjQsIFZhbGVyaW8gU2V0dGkgd3JvdGU6
Cj4+IE9uIDUvMjIvMjYgMDE6MTUsIE1hcmsgQnJvd24gd3JvdGU6Cj4+PiBPbiBGcmksIE1heSAx
NSwgMjAyNiBhdCAwNToxMDo0MFBNICswMjAwLCBWYWxlcmlvIFNldHRpIHdyb3RlOgo+Pj4+IENy
ZWF0ZSBhIG5ldyBEQVBNIHdpZGdldCBmb3IgIkkyUyBmb3JtYXR0ZXIiIGFuZCBwbGFjZSBpdCBv
biB0aGUgcGF0aAo+Pj4+IGJldHdlZW4gRklGTyBhbmQgb3V0cHV0IERBSSBpbnRlcmZhY2UuIFJl
bW92ZSBJMlMgb3V0cHV0IGZvcm1hdHRpbmcgY29kZQo+Pj4+IGZyb20gYWl1LWVuY29kZXItaTJz
IHNpbmNlIGl0J3Mgbm93IGltcGxlbWVudGVkIGZyb20gYWl1LWZvcm1hdHRlci1pMnMuCj4+Pgo+
Pj4gVGhpcyBzZXJpZXMsIGl0IGxvb2tzIGxpa2UgdGhpcyBzcGVjaWZpYyBwYXRjaCwgaXMgYnJl
YWtpbmcgcGNtLXRlc3Qgb24KPj4+IG15IGxpYnJldGVjaCBMZSBQb3RhdG8gYm9hcmQsIHRoZSBj
bG9ja2luZyBsb29rcyB0byBiZSBzZXJpb3VzbHkgbWVzc2VkCj4+PiB1cC7CoCBJJ20gZ2V0dGlu
ZzoKPj4+Cj4+PiBbLi4uXQo+Pj4KPj4+IEZ1bGwgbG9nOgo+Pj4KPj4+IMKgwqDCoCBodHRwczov
L2xhdmEuc2lyZW5hLm9yZy51ay9zY2hlZHVsZXIvam9iLzI3ODYzNDIjTDE5MzQKPj4+Cj4+PiBU
aGUgcHJpb3IgcGF0Y2hlcyBzZWVtIHRvIHRlc3QgZmluZSwgaXQncyB0aGlzIG9uZSB0aGF0IHNl
ZW1zIHRvCj4+PiBpbnRyb2R1Y2UgdGhlIGlzc3VlLgo+PiBUaGFua3MgYSBsb3QgZm9yIHRoZSBo
ZWFkcyB1cCBhbmQgcGxlYXNlIGFwb2xvZ2l6ZSBmb3IgdGhlIHByb2JsZW0uCj4+IEkgd2Fzbid0
IGF3YXJlIG9mIHRoZXNlIHRlc3RpbmcgdG9vbHMgc28gSSBiYXNlZCBteSB0ZXN0aW5nIG9uIHBs
YXlpbmcKPj4gd2l0aCB1c2Vyc3BhY2UgYWxzYSB0b29scyBvbiB0aGUgcGh5c2ljYWwgYm9hcmQg
dGhhdCBJIGhhdmUuCj4+IEkgd2lsbCB0YWtlIGEgbG9vayBhdCBpdCBBU0FQIGFuZCBzZW5kIGEg
cHJvcGVybHkgdGVzdGVkIHYyLgo+PiAKPgo+IEhpIQo+Cj4gSSBpbnZlc3RpZ2F0ZWQgYSBiaXQg
b24gdGhlIGlzc3VlIGNhdXNlZCBieSBteSB2MSBwYXRjaCBzZXJpZXMgYW5kIEkgdGhpbmsKPiBJ
J3ZlIGZvdW5kIHRoZSByb290IGNhdXNlLiBJIHN1c3BlY3QgbXkgcGF0Y2ggc2VyaWVzIGhlbHBl
ZCBkaXNjb3ZlcmluZyBhCj4gbWlzYmVoYXZpb3IgdGhhdCB3YXMgYWxyZWFkeSBwcmVzZW50LCBz
byBJJ20gc2Vla2luZyBmb3Igc3VnZ2VzdGlvbnMgb24gdGhlCj4gcHJvcGVyIHdheSB0byBwcm9j
ZWVkLgo+Cj4gIyBGaXJzdDogdGhlIGJhY2tncm91bmQKPgo+IEJ5IGRlZmF1bHQgb24gT2Ryb2lk
QzIvTGVQb3RhdG8gYm9hcmRzIHRoZSBvbmx5IGF2YWlsYWJsZSBhdWRpbyBwbGF5YmFjayBpcwo+
IHRocm91Z2ggSERNSS4gRnJvbSBEQUkgcG9pbnQgb2YgdmlldyB0aGUgZmxvdyBpcyBhcyBmb2xs
b3dzOgo+Cj4gIkkyUyBGSUZPIiAtPiAiSTJTIEVuY29kZXIgUGxheWJhY2siIC0+ICJDT0RFQyBD
VFJMIEhETUkgSTJTIElOIiAtPiAiSERNSQo+IENUUkwgU1JDIiAobWl4ZXIpIC0+ICJDT0RFQyBD
VFJMIEhETUkgT1VUIENhcHR1cmUiCj4KPiBJbiB0aGlzIGNoYWluIHRoZSBtaXhlciAiSERNSSBD
VFJMIFNSQyIgYnkgZGVmYXVsdCBzdGFydHMgYXMgIkRJU0FCTEVEIiBzbwo+IGl0IHNob3VsZCBw
cmV2ZW50ICJDT0RFQyBDVFJMIEhETUkgT1VUIENhcHR1cmUiIGZyb20gcmVjZWl2aW5nIGRhdGEu
CgpZZXMsIGxlYXZpbmcgcmVnaXN0ZXJzIHRvIHRoZWlyIGRlZmF1bHQgc3RhdGUgKGV2ZW4gaWYg
aXQgaXMgbm90IGEKd29ya2luZyBjb25maWd1cmF0aW9uKSBhbmQgcmVseWluZyBvbiBtaXhlciBw
YXRoIHRvIGJlIHNldHVwIHdhcyBkb25lIG9uCnB1cnBvc2UuCgpUaGVyZSBpcyBub3QgYSBzaW5n
bGUgY29uZmlndXJhdGlvbiB0aGF0IHdvdWxkIHdvcmsvcGxlYXNlIGV2ZXJ5b25lLAplc3BlY2lh
bGx5IG9uIEFYRyBidXQgdGhlIHNhbWUgY291bGQgYmUgc2FpZCBhYm91dCB0aGUgR1gKc2VyaWVz
LgoKTm90IGhhcmRjb2RpbmcgYW55IHN1Y2ggY29uZmlndXJhdGlvbiBpbiB0aGUgZHJpdmVyIHdh
cyB0aGUgb25seSBzYW5lCmNob2ljZSwgZXZlbiBpZiBpdCBtYXkgc2VlbSB0byB3ZWlyZCB0byBo
YXZlIHBpcGVsaW5lcyB0aGF0IGRvIG5vdCB3b3JrCmJ5IGRlZmF1bHQuCgo+Cj4gIyBXaGF0IGNo
YW5nZWQgYmVmb3JlL2FmdGVyIHRoZSBsYXN0IGNvbW1pdCBvZiBteSBwYXRjaCBzZXJpZXM/Cj4K
PiAtIEJlZm9yZTogImFpdS1lbmNvZGVyLWkycy5jIiB3YXMgY2FsbGluZyAiYWl1X2VuY29kZXJf
aTJzX3NldHVwX2Rlc2MoKSIgaW4KPiAgICJod19wYXJhbXMoKSIuIEF1ZGlvIHBsYXliYWNrIHNo
b3VsZG4ndCB3b3JrIGluIHRoaXMgY29uZGl0aW9uIGJlY2F1c2UgYXMKPiAgIEkgbWVudGlvbmVk
ICJIRE1JIENUUkwgU1JDIj0iRElTQUJMRUQiIGJ5IGRlZmF1bHQsIGJ1dCBhcHBhcmVudGx5Cj4g
ICBjb25maWd1cmluZyB0aGUgQUlVX0kyU19TT1VSQ0VfREVTQyByZWdpc3RlciBpcyBlbm91Z2gg
dG8gbWFrZSB0aGUKPiAgcGxheWJhY2sgdG8gd29yayBwcm9wZXJseS4KCk5pY2UgOicoCgo+Cj4g
LSBBZnRlcjogdGhvc2UgY29uZmlndXJhdGlvbnMgYXJlIG9ubHkgc2V0IHdoZW4gImFpdV9mb3Jt
YXR0ZXJfaTJzX3ByZXBhcmUiCj4gICBpcyBjYWxsZWQgd2hpY2ggaGFwcGVucyBpZiAiSTJTIEZv
cm1hdHRlciIgd2lkZ2V0IGlzIGVuYWJsZWQuIFNpbmNlICJIRE1JCj4gICBDVFJMIFNSQyI9IkRJ
U0FCTEVEIiB0aGVuICJJMlMgRm9ybWF0dGVyIiBpcyBub3QgcG93ZXJlZCB1cCBhbmQgdGhlcmVm
b3JlCj4gICBpdHMgY2FsbGJhY2tzIGFyZSBub3QgY2FsbGVkIGFuZCB0aGUgcGxheWJhY2sgZmFp
bHMuCj4KPiBTaW1wbHkgaXNzdWluZyB0aGUgZm9sbG93aW5nIGNvbW1hbmQ6Cj4gJCBhbWl4ZXIg
c3NldCAnQUlVIEhETUkgQ1RSTCBTUkMnICdJMlMnCj4KPiByZXNvbHZlcyB0aGUgcHJvYmxlbSBh
bmQgYWxsIHBjbS10ZXN0cyBwYXNzLgo+IFRoaXMgYWxzbyBleHBsYWlucyB3aHkgSSBkaWRuJ3Qg
Y2F0Y2ggdGhpcyBpc3N1ZSBiZWZvcmUgc2VuZGluZyB0aGUgdjEKPiBzZXJpZXM6IEkgdGVzdGVk
IHdpdGggTlhQIFNHVEw1MDAwIGNvZGVjLCBub3QgdGhlIEhETUkgb25lLgo+Cj4gIyBGaW5hbCBx
dWVzdGlvbgo+Cj4gSSBoYXZlIDIgYWx0ZXJuYXRpdmUgcHJvcG9zYWxzIGZvciB0aGlzOgo+Cj4g
LSBDaGFuZ2UgdGhlIGRlZmF1bHQgdmFsdWUgb2YgIkhETUkgQ1RSTCBTUkMiIHNvIHRoYXQgYXQg
Ym9vdCBpdCdzIHNldCB0bwo+ICAgc29tZSB3b3JraW5nIGNvbmZpZ3VyYXRpb24gKGV4OiAiSTJT
IikuIFRoaXMgc2hvdWxkIGJlIGRvbmUgc29tZXdoZXJlIGluCj4gICJhaXUtY29kZWMtY3RybCIg
SSB0aGluay4KPiAtIFJ1biB0aGUgJ2FtaXhlcicgY29tbWFuZCBhYm92ZSBiZWZvcmUgcnVubmlu
ZyBBTFNBIHRlc3RzLgo+Cj4gQW55IHN1Z2dlc3Rpb24gb24gd2hhdCdzIHRoZSBiZXN0IGFwcHJv
YWNoPwoKQXMgTWFyayBzdWdnZXN0ZWQsIGxldCBiZSBuaWNlIG9uIHRoZSB1c2VyIGFuZCBwb2tl
IHRoZSByZWdpc3RlciBvbgpwcm9iZS4gSnVzdCBhZGQgYSBiaWcgZmF0IGNvbW1lbnQgYXJvdW5k
IGl0IHNvIGl0IGlzIGNsZWFyIHdoeSB5b3UgYXJlCmRvaW5nIGl0IChhbmQgd2h5IGl0IGlzIG5v
dCBzb21ldGhpbmcgdG8gYmUgY29waWVkKQoKPgo+IFRoYW5rcyBhIGxvdC4KCi0tIApKZXJvbWUK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
