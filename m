Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F67DCCF9F0
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Oct 2025 08:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HEK7SLxH+4cwIQxS3FzOYPzj6GiOwXhztW4TEdikhdk=; b=oYX1nkdfEtMiPn
	IgQ5FR/wH2r7GCo3qTTTk2wkXIkpXSXKnQrP4ZP+svoQP4jAnstj/OaQIb+xmBW1t+P3PFx7kKHg8
	k+Xth0MD+sm92g1cfRo+YVJ2DuWj/ZUKnKkqwkXTktVyaUutPOJeECXaUO0gk/qjfMOo2oo7mtgDM
	PtBysLz6U7J/b2yAR/RLT6jM8PsebGOByNTl4x9QbDB12V+eOAWkp8fFflgxTO6dxBHi0X51VMSNv
	wzjhDfqTKonzbWLxBsOKjwkOB8O7uYeFsnCc1yFpWWzknijtD0uxW97m7uXHcyK9WO1zqoa9X93Ay
	+q470lGCDFmA0tde5YCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOB2-00000003lgI-2TLk;
	Thu, 30 Oct 2025 08:38:36 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOAy-00000003lf8-3wA5
	for linux-amlogic@lists.infradead.org;
	Thu, 30 Oct 2025 08:38:34 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4710683a644so7936025e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 30 Oct 2025 01:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761813511; x=1762418311; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XcL62a5hHqNXI6ber/2x37lX4UAGBk2bkZQAgf4AoSc=;
        b=aLn7g1yfA+X717gjZPZzChJVZ23/wcDXE/ABUswAgtzZ/WH0CgXoTsusigJB8CL8Oj
         /DjrMSBdldIF5TpRGQn884OX52OxDwDenj5jqPPhhw5Ue6KmKEvnZ9wj9Y2aXO72OunK
         qeQVk6mmZUs9URxptMmqrO4jqBbcezp6ySHGZhekIhRbaCYEiv2kymFT78nW5uHlnEtV
         UxswP6eAiErgOP1f3BwBwLTrhyzToX93s3AagRh0J5D9Qof38I76gspq5xKZVbm2AUDh
         GNrz+Dx+Gq9gr/xSdUNZgsrXKunFMJdJADWDIzKAK7v1Ju29KsP5z+oO+MsArRWehbn4
         a4dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761813511; x=1762418311;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XcL62a5hHqNXI6ber/2x37lX4UAGBk2bkZQAgf4AoSc=;
        b=Aa13yf6QerJ0lN/kPbtCyZMFB4JUlxEAMiv7M3kRlxbWCcesKUSyrEDBvp6PZ9QVeo
         ZolJlpyIrxqtcWVQIvQf/DZulGVLW3mCZa7H5Lz1iANVuzK7bG08gFB9dspseJkBjtKY
         8qQkN2PoBFzzj1EvlOQjwU49wJK/CrpIh56QBG+Y2NLhd0X/ngWknwApQZuiqa98BNRi
         LLZfPRab1maX/xdFw+TwMjpkYwr1qGhpU4jOONQP9rd5hQqpO/jNKIDaKwrfEIXc65Hk
         tY8JlDLTAW01Abml0OGqH9ZJhEU1JCXTmdWJAVHXxLHaUFp+XXSDyrfmYapC5jAbsTFA
         aTTw==
X-Forwarded-Encrypted: i=1; AJvYcCWHmS0YyRHtxFpSvPTfWGNr4WMaq2F9Px7wRgEV0xgSOrLryjInewvo6r/dOmrXN+KZZWwwiQfpnweCRoPG@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1z07+rPSyvLbIgwU2mQw3V5Dc0fTNb/GaQ/8IM7qdE2qDmBfO
	MUfK1zg5wQeo3dDXwKmx0AtZwrp+ZUxW473oJk1XS8uZM8qemJRZouAWCkKAVAJ6r9w=
X-Gm-Gg: ASbGncvUjXSWBva0ptHqdHwfdVTeIW/YCH0YfmH4RCv5pUEDi01p96MAPHDzimlUv2h
	4hQbelBA6yq/LinVtFUlqaZfPHd89ftsIx7zZr0gkje000xyWmnN7klTGVSMGs6P8d5+aKTP/OB
	25qvYII6aXcLLOxSoISNYpYYZoXg5orDi+yzgj0JXjsrPZaUUKAspW2PXBMWuUSaHLGfdIAGYko
	nqsTLdkasnAvg8Pbmtpo9BLf6jnNI5et9kBfsNKqWGXImwUd8xkKAiIF915lj+zvEMPc6F0UudC
	sp5Krmft1l3caxHMs6Qo29axYRCBBEhFpdzO0+ai4Pmaf5yt2chib5H/77cfWvF1OYGoGfEZb9H
	5H8xzgd19OX4zOXdLQ+SLuGLh2PBrbp9pSOrTBUoRRejXFwpGDqFliHOGw9RalWGIXtd0vFZj55
	HDfopIoLZG
X-Google-Smtp-Source: AGHT+IGaIha2nuoz8jrt+cE5pgI+VJzm+ijZNjpXMyU/F0fQvHyvDhStIYNXWfm/PBDpohWawi3FOQ==
X-Received: by 2002:a05:600c:44c9:b0:477:11a0:b746 with SMTP id 5b1f17b1804b1-47726239d25mr15315075e9.6.1761813510964;
        Thu, 30 Oct 2025 01:38:30 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:64bd:9043:d05:7012])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-477289a57fdsm26741525e9.7.2025.10.30.01.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 01:38:30 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  chuan.liu@amlogic.com,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
  da@libre.computer
Subject: Re: [PATCH v2 4/5] clk: amlogic: Optimize PLL enable timing
In-Reply-To: <20251030-optimize_pll_driver-v2-4-37273f5b25ab@amlogic.com>
	(Chuan Liu via's message of "Thu, 30 Oct 2025 13:24:14 +0800")
References: <20251030-optimize_pll_driver-v2-0-37273f5b25ab@amlogic.com>
	<20251030-optimize_pll_driver-v2-4-37273f5b25ab@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 30 Oct 2025 09:38:29 +0100
Message-ID: <1ja518zsvu.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_013832_993596_F461782A 
X-CRM114-Status: GOOD (  23.01  )
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

T24gVGh1IDMwIE9jdCAyMDI1IGF0IDEzOjI0LCBDaHVhbiBMaXUgdmlhIEI0IFJlbGF5IDxkZXZu
dWxsK2NodWFuLmxpdS5hbWxvZ2ljLmNvbUBrZXJuZWwub3JnPiB3cm90ZToKCj4gRnJvbTogQ2h1
YW4gTGl1IDxjaHVhbi5saXVAYW1sb2dpYy5jb20+Cj4KPiBsX2RldGVjdCBjb250cm9scyB0aGUg
ZW5hYmxlbWVudCBvZiB0aGUgUExMIGxvY2sgZGV0ZWN0aW9uIG1vZHVsZS4KPiBJdCBzaG91bGQg
cmVtYWluIGRpc2FibGVkIHdoaWxlIHRoZSBpbnRlcm5hbCBQTEwgY2lyY3VpdHMgYXJlCj4gcmVh
Y2hpbmcgYSBzdGVhZHkgc3RhdGU7IG90aGVyd2lzZSwgdGhlIGxvY2sgc2lnbmFsIG1heSBiZSBm
YWxzZWx5Cj4gdHJpZ2dlcmVkIGhpZ2guCj4KPiBCZWZvcmUgZW5hYmxpbmcgdGhlIGludGVybmFs
IHBvd2VyIHN1cHBseSBvZiB0aGUgUExMLCBsX2RldGVjdCBzaG91bGQKPiBiZSBkaXNhYmxlZC4g
QWZ0ZXIgdGhlIFBMTOKAmXMgaW50ZXJuYWwgY2lyY3VpdHMgaGF2ZSBzdGFiaWxpemVkLAo+IGxf
ZGV0ZWN0IHNob3VsZCBiZSBlbmFibGVkIHRvIHByZXZlbnQgZmFsc2UgbG9jayBzaWduYWwgdHJp
Z2dlcnMuCgpZb3UgdG8gcmVmb3JtYXQgdGhpcyBkZXNjcmlwdGlvbi4gSXQgZmVlbCB0aGF0IGJv
dGggcGFyYWdyYXBoIGFyZSBzYXlpbmcKdGhlIHNhbWUgdGhpbmcuCgo+Cj4gQ3VycmVudGx5LCBv
bmx5IEExIHN1cHBvcnRzIGJvdGggbF9kZXRlY3QgYW5kIGN1cnJlbnRfZW4sIHNvIHRoaXMKPiBw
YXRjaCB3aWxsIG9ubHkgYWZmZWN0IEExLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2h1YW4gTGl1IDxj
aHVhbi5saXVAYW1sb2dpYy5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvY2xrL21lc29uL2Nsay1wbGwu
YyB8IDI4ICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDE1
IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Y2xrL21lc29uL2Nsay1wbGwuYyBiL2RyaXZlcnMvY2xrL21lc29uL2Nsay1wbGwuYwo+IGluZGV4
IDZjNzk0YWRiOGNjZC4uYzZlZWJkZTFmNTE2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvY2xrL21l
c29uL2Nsay1wbGwuYwo+ICsrKyBiL2RyaXZlcnMvY2xrL21lc29uL2Nsay1wbGwuYwo+IEBAIC0z
ODMsMzYgKzM4MywzOCBAQCBzdGF0aWMgaW50IG1lc29uX2Nsa19wbGxfZW5hYmxlKHN0cnVjdCBj
bGtfaHcgKmh3KQo+ICAJaWYgKE1FU09OX1BBUk1fQVBQTElDQUJMRSgmcGxsLT5yc3QpKQo+ICAJ
CW1lc29uX3Bhcm1fd3JpdGUoY2xrLT5tYXAsICZwbGwtPnJzdCwgMSk7Cj4gIAo+ICsJLyogRGlz
YWJsZSB0aGUgUExMIGxvY2stZGV0ZWN0IG1vZHVsZSAqLwo+ICsJaWYgKE1FU09OX1BBUk1fQVBQ
TElDQUJMRSgmcGxsLT5sX2RldGVjdCkpCj4gKwkJbWVzb25fcGFybV93cml0ZShjbGstPm1hcCwg
JnBsbC0+bF9kZXRlY3QsIDEpOwo+ICsKPiAgCS8qIEVuYWJsZSB0aGUgcGxsICovCj4gIAltZXNv
bl9wYXJtX3dyaXRlKGNsay0+bWFwLCAmcGxsLT5lbiwgMSk7Cj4gIAkvKiBXYWl0IGZvciBCYW5k
Z2FwIGFuZCBMRE8gdG8gcG93ZXIgdXAgYW5kIHN0YWJpbGl6ZSAqLwo+ICAJdWRlbGF5KDIwKTsK
PiAgCj4gLQkvKiBUYWtlIHRoZSBwbGwgb3V0IHJlc2V0ICovCj4gLQlpZiAoTUVTT05fUEFSTV9B
UFBMSUNBQkxFKCZwbGwtPnJzdCkpCj4gLQkJbWVzb25fcGFybV93cml0ZShjbGstPm1hcCwgJnBs
bC0+cnN0LCAwKTsKCldoeSBpcyB0aGUgcmVzZXQgbW92aW5nIGFyb3VuZCA/IG5vdGhpbmcgaXMg
c2FpZCBpbiB0aGUgZGVzY3JpcHRpb24gYWJvdXQKdGhhdAoKPiAtCj4gLQkvKiBXYWl0IGZvciBQ
TEwgbG9vcCBzdGFiaWxpemF0aW9uICovCj4gLQl1ZGVsYXkoMjApOwo+IC0KPiAgCS8qCj4gIAkg
KiBDb21wYXJlZCB3aXRoIHRoZSBwcmV2aW91cyBTb0NzLCBzZWxmLWFkYXB0aW9uIGN1cnJlbnQg
bW9kdWxlCj4gIAkgKiBpcyBuZXdseSBhZGRlZCBmb3IgQTEsIGtlZXAgdGhlIG5ldyBwb3dlci1v
biBzZXF1ZW5jZSB0byBlbmFibGUgdGhlCj4gIAkgKiBQTEwuIFRoZSBzZXF1ZW5jZSBpczoKPiAt
CSAqIDEuIGVuYWJsZSB0aGUgcGxsLCBkZWxheSBmb3IgMTB1cwo+ICsJICogMS4gZW5hYmxlIHRo
ZSBwbGwsIGRlbGF5IGZvciAyMHVzCj4gIAkgKiAyLiBlbmFibGUgdGhlIHBsbCBzZWxmLWFkYXB0
aW9uIGN1cnJlbnQgbW9kdWxlLCBkZWxheSBmb3IgNDB1cwo+ICAJICogMy4gZW5hYmxlIHRoZSBs
b2NrIGRldGVjdCBtb2R1bGUKPiAgCSAqLwo+ICAJaWYgKE1FU09OX1BBUk1fQVBQTElDQUJMRSgm
cGxsLT5jdXJyZW50X2VuKSkgewo+IC0JCXVkZWxheSgxMCk7Cj4gIAkJbWVzb25fcGFybV93cml0
ZShjbGstPm1hcCwgJnBsbC0+Y3VycmVudF9lbiwgMSk7Cj4gLQkJdWRlbGF5KDQwKTsKPiArCQl1
ZGVsYXkoMjApOwo+ICAJfQo+ICAKPiAtCWlmIChNRVNPTl9QQVJNX0FQUExJQ0FCTEUoJnBsbC0+
bF9kZXRlY3QpKSB7Cj4gLQkJbWVzb25fcGFybV93cml0ZShjbGstPm1hcCwgJnBsbC0+bF9kZXRl
Y3QsIDEpOwo+ICsJLyogVGFrZSB0aGUgcGxsIG91dCByZXNldCAqLwo+ICsJaWYgKE1FU09OX1BB
Uk1fQVBQTElDQUJMRSgmcGxsLT5yc3QpKQo+ICsJCW1lc29uX3Bhcm1fd3JpdGUoY2xrLT5tYXAs
ICZwbGwtPnJzdCwgMCk7Cj4gKwo+ICsJLyogV2FpdCBmb3IgUExMIGxvb3Agc3RhYmlsaXphdGlv
biAqLwo+ICsJdWRlbGF5KDIwKTsKPiArCj4gKwkvKiBFbmFibGUgdGhlIGxvY2stZGV0ZWN0IG1v
ZHVsZSAqLwo+ICsJaWYgKE1FU09OX1BBUk1fQVBQTElDQUJMRSgmcGxsLT5sX2RldGVjdCkpCj4g
IAkJbWVzb25fcGFybV93cml0ZShjbGstPm1hcCwgJnBsbC0+bF9kZXRlY3QsIDApOwo+IC0JfQo+
ICAKPiAgCWlmIChtZXNvbl9jbGtfcGxsX3dhaXRfbG9jayhodykpIHsKPiAgCQkvKiBkaXNhYmxl
IFBMTCB3aGVuIFBMTCBsb2NrIGZhaWxlZC4gKi8KCi0tIApKZXJvbWUKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBs
aXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
