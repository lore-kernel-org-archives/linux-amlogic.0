Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F6ECCD1BB
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Oct 2025 12:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b71wWcAKNFjn9BWSQW7tNqk5Js6ce4LbBydzjrNc/KY=; b=HWY/o+JpaaIK5M
	CSVeJV5p/KrITzPuzhd6ugO9wpxr/lC+6tJKm++WopDM8DOycAj1Py237oNmtJ1eV4W9C6Hngm4gC
	UUyXrxk4yb4ppEndQkEcSUQ8/w/GPV8MpSKCg3ZszQUtsuN1Vj35w5Mrxx6UK3H7/kt/izAq0A0Zk
	vB/l8WA5UuxSKPzR1RzOOeaTuYE/jQXC78K8DOih8/ChS/GYIcTggr4eudecS7mSjHUM2GPEbyDJo
	f4hXErE+z0luFK5YXCQSn9ZW+HzKFTVHzPjD9+AKAtTqBXZkOnI2rQSeWEufwjhKSDLkOZ6Ck/QgT
	lmm+ImppuLxaIjV4i9Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBXWk-00000002jiI-1Bz8;
	Wed, 22 Oct 2025 12:01:14 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBXWe-00000002jgD-3Aul
	for linux-amlogic@lists.infradead.org;
	Wed, 22 Oct 2025 12:01:11 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-421851bcb25so4056806f8f.2
        for <linux-amlogic@lists.infradead.org>; Wed, 22 Oct 2025 05:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761134467; x=1761739267; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JyR5VW+NAmVdJ0hvRREYbhuTAh8CBmPExIybD/RpDM0=;
        b=hnJPX0iweU+zHBl1Ix1g9/LJWqwIgROgcdt7zjyh3Xb/y58QeykGXSeVQFA5ZiDUJE
         7e9pORbDzPe1tRDzid4imi+QwyJFDD5zw+O6aGH64toLYj5p1JlAsniSZbXDFKnVIZ7e
         meqmAmK3M+JxGYcjIZp4xknN07lDA/Iv1tK/JamRnbb45bgVaIzn0AHb6ZviE6VadH5R
         +/5S5EdmVtLEdkHdRU9uKiHv87a2pJrDIOBQrWsDqWG6yjbcllQ2SApS+OzTa5H/meYg
         NH6pGjSHntTShakqoigwHtFsxYy5Ewaym/Qlp6dSlEWIGprkSE+xUJC8MHYF1XpVT9LL
         o6/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761134467; x=1761739267;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JyR5VW+NAmVdJ0hvRREYbhuTAh8CBmPExIybD/RpDM0=;
        b=w0THq2xfOVXxLnAdaKScQ1m9BnOgb52ODAOfjLfLbvkWPnnmeqErUvA5FC+MEMyS4A
         vIqmSoK6kt92vg0qbWY7qaQ8FE7SHd4Um2EMm22YQzAyPy4Vziqels6Ua8N7LRv2GiRo
         AkNEcYDUiOtLGMnwje5uaD6Ztoa/npwjBPORKQI3J2nYd1xFIRvWG1eceQDRuAWZVmNv
         2USwhuExiQNyXuYVSgZSKt9C0GdzTXaD3mf4tEXRpaB61e926XIfAn91XuT/NMA8tmv/
         T5g4d43JN4bmQVQHWxEJwydbVcIcup/k1KWHcDqDxwnUCZtMn9g5MT7Gf5P/7/9Ev/2/
         FtLg==
X-Forwarded-Encrypted: i=1; AJvYcCUjA57jwGETPnVCvIWY2CRHRU8sl1cdDxOQG7aeLzGGwgESWQf1ZgrAQoaJEACu9BaeplONBryOJ0CbuY/j@lists.infradead.org
X-Gm-Message-State: AOJu0YwaHwgAY6XRyOMARX/k/kooAuXCf37opfrTJvjExzOGbzWsbCkZ
	u0qEDijvbDW7INZKww9S+1XsP7c0hGb8sBH6wCbYWoD0ipMMtA1N6z3zcKdd2tXe4Rg=
X-Gm-Gg: ASbGnctyJujplGVOuxKSGq3snpaOa82mBZQwtRwZC776M5iXJwPAiWD2duPn0pa2KWQ
	5KMOWi7un7Ncu5Zn8cxaxhQLxgPiCV/v3DDVZOf/UTO5Jmn/dnXfLaZerH5UsXef4q8PzBrnIZ/
	Olw2AmdOfWSEXwCuRC2/N8QfBK67Fqu2gURataSxltwtvEQd6JbAASJbzqdXz6TguzBKptrrawm
	thQG3/dyMduAxCh2Vv5sgZZh/nQKF7G07riplTsF13t4QAT7XxUmc5Ie00wRTtlg9FAysNofARA
	0LXt2ilnNBMZ9Ci0/j53sLW2EgNQ9F0y2i7/PpwjyGPfBM7HU93tDjLzwG6iT9OSzw9RjvSlEtt
	n8no0yzSmKxEHJP1LR3hPNPmlxvsJHWAsuv6XYfKPzFI7j4WmyD+WtyLY9xrcsuZYk3DJgC787o
	w=
X-Google-Smtp-Source: AGHT+IHbsKbAfuuLVLCAlwiAoOjeCSzSKz7jOyG6Tnh4cKgyrUKbbUqK56xJxiIvGc2SH5FLobbRRQ==
X-Received: by 2002:a5d:5f94:0:b0:425:856f:70ff with SMTP id ffacd0b85a97d-42704d99cf6mr15941694f8f.45.1761134466809;
        Wed, 22 Oct 2025 05:01:06 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:bdae:f4f4:58be:ea26])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-427f009a797sm24998630f8f.27.2025.10.22.05.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 05:01:06 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  chuan.liu@amlogic.com,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: amlogic: Optimize PLL enable timing
In-Reply-To: <20251022-optimize_pll_driver-v1-2-a275722fb6f4@amlogic.com>
	(Chuan Liu via's message of "Wed, 22 Oct 2025 14:58:52 +0800")
References: <20251022-optimize_pll_driver-v1-0-a275722fb6f4@amlogic.com>
	<20251022-optimize_pll_driver-v1-2-a275722fb6f4@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 22 Oct 2025 14:01:05 +0200
Message-ID: <1j347b403i.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_050109_669821_23E47503 
X-CRM114-Status: GOOD (  25.48  )
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

T24gV2VkIDIyIE9jdCAyMDI1IGF0IDE0OjU4LCBDaHVhbiBMaXUgdmlhIEI0IFJlbGF5IDxkZXZu
dWxsK2NodWFuLmxpdS5hbWxvZ2ljLmNvbUBrZXJuZWwub3JnPiB3cm90ZToKCj4gRnJvbTogQ2h1
YW4gTGl1IDxjaHVhbi5saXVAYW1sb2dpYy5jb20+Cj4KPiBBbWxvZ2ljIFBMTCBsb2NraW5nIHBy
b2NlZHVyZSBzaGFsbCBmb2xsb3cgdGhpcyB0aW1pbmcgc2VxdWVuY2U6Cj4gMSBBc3NlcnQgcmVz
ZXQgc2lnbmFsOiBFbnN1cmVzIFBMTCBjaXJjdWl0cyBlbnRlciBrbm93biBpbml0aWFsIHN0YXRl
Lgo+IDIgRGVhc3NlcnQgbG9jay1kZXRlY3Qgc2lnbmFsOiBBdm9pZCBsb2NrIHNpZ25hbCBmYWxz
ZSB0cmlnZ2VyaW5nLgo+IDMgQXNzZXJ0IGVuYWJsZSBzaWduYWw6IFBvd2VycyB1cCBQTEwgc3Vw
cGx5Lgo+IDQgdWRlbGF5KDIwKTogV2FpdCBmb3IgQmFuZGdhcCBhbmQgTERPIHRvIHBvd2VyIHVw
IGFuZCBzdGFiaWxpemUuCj4gNSBFbmFibGUgc2VsZi1hZGFwdGF0aW9uIGN1cnJlbnQgbW9kdWxl
IChPcHRpb25hbCkuCj4gNiBEZWFzc2VydCByZXNldCBzaWduYWw6IFJlbGVhc2VzIFBMTCB0byBi
ZWdpbiBub3JtYWwgb3BlcmF0aW9uLgo+IDcgdWRlbGF5KDIwKTogV2FpdCBmb3IgUExMIGxvb3Ag
c3RhYmlsaXphdGlvbi4KPiA4IEFzc2VydCBsb2NrLWRldGVjdCBzaWduYWw6IGxvY2sgZGV0ZWN0
aW9uIGNpcmN1aXQgc3RhcnRzIHRvIHdvcmsuCj4gOSBNb25pdG9yIGxvY2sgc3RhdHVzIHNpZ25h
bDogV2FpdCBmb3IgUExMIGxvY2sgY29tcGxldGlvbi4KPiAxMCBJZiB0aGUgUExMIGZhaWxzIHRv
IGxvY2ssIGl0IHNob3VsZCBiZSBkaXNhYmxlZCwgVGhpcyBtYWtlcyB0aGUKPiBsb2dpYyBtb3Jl
IGNvbXBsZXRlLCBhbmQgYWxzbyBoZWxwcyBzYXZlIHVubmVjZXNzYXJ5IHBvd2VyIGNvbnN1bXB0
aW9uCj4gd2hlbiB0aGUgUExMIGlzIG1hbGZ1bmN0aW9uaW5nLgoKSXMgdGhpcyBhcHBsaWNhYmxl
IHRvIGFsbCBzdXBwb3J0ZWQgU29DID8gZnJvbSBtZXNvbjggdG8gczQgPwoKV2hhdCBkaWQgeW91
IHRlc3QgPwoKCj4KPiBTaWduZWQtb2ZmLWJ5OiBDaHVhbiBMaXUgPGNodWFuLmxpdUBhbWxvZ2lj
LmNvbT4KPiAtLS0KPiAgZHJpdmVycy9jbGsvbWVzb24vY2xrLXBsbC5jIHwgNjggKysrKysrKysr
KysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0
MCBpbnNlcnRpb25zKCspLCAyOCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2Nsay9tZXNvbi9jbGstcGxsLmMgYi9kcml2ZXJzL2Nsay9tZXNvbi9jbGstcGxsLmMKPiBpbmRl
eCBiMDdlMWViMTlkMTIuLjI2YzgzZGI0ODdlOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2Nsay9t
ZXNvbi9jbGstcGxsLmMKPiArKysgYi9kcml2ZXJzL2Nsay9tZXNvbi9jbGstcGxsLmMKPiBAQCAt
MzUzLDYgKzM1MywyMyBAQCBzdGF0aWMgaW50IG1lc29uX2Nsa19wY2llX3BsbF9lbmFibGUoc3Ry
dWN0IGNsa19odyAqaHcpCj4gIAlyZXR1cm4gLUVJTzsKPiAgfQo+ICAKPiArc3RhdGljIHZvaWQg
bWVzb25fY2xrX3BsbF9kaXNhYmxlKHN0cnVjdCBjbGtfaHcgKmh3KQo+ICt7Cj4gKwlzdHJ1Y3Qg
Y2xrX3JlZ21hcCAqY2xrID0gdG9fY2xrX3JlZ21hcChodyk7Cj4gKwlzdHJ1Y3QgbWVzb25fY2xr
X3BsbF9kYXRhICpwbGwgPSBtZXNvbl9jbGtfcGxsX2RhdGEoY2xrKTsKPiArCj4gKwkvKiBQdXQg
dGhlIHBsbCBpcyBpbiByZXNldCAqLwo+ICsJaWYgKE1FU09OX1BBUk1fQVBQTElDQUJMRSgmcGxs
LT5yc3QpKQo+ICsJCW1lc29uX3Bhcm1fd3JpdGUoY2xrLT5tYXAsICZwbGwtPnJzdCwgMSk7Cj4g
Kwo+ICsJLyogRGlzYWJsZSB0aGUgcGxsICovCj4gKwltZXNvbl9wYXJtX3dyaXRlKGNsay0+bWFw
LCAmcGxsLT5lbiwgMCk7Cj4gKwo+ICsJLyogRGlzYWJsZSBQTEwgaW50ZXJuYWwgc2VsZi1hZGFw
dGlvbiBjdXJyZW50IG1vZHVsZSAqLwo+ICsJaWYgKE1FU09OX1BBUk1fQVBQTElDQUJMRSgmcGxs
LT5jdXJyZW50X2VuKSkKPiArCQltZXNvbl9wYXJtX3dyaXRlKGNsay0+bWFwLCAmcGxsLT5jdXJy
ZW50X2VuLCAwKTsKPiArfQoKSSBkb24ndCBnZXQgd2h5IHlvdSBtb3ZlZCB0aGF0IGNvZGUgYXJv
dW5kIGFuZCBtYWtlIHRoZSBkaWZmIGV2ZW4gaGFyZGVyCnRvIHJlYWQKCj4gKwo+ICBzdGF0aWMg
aW50IG1lc29uX2Nsa19wbGxfZW5hYmxlKHN0cnVjdCBjbGtfaHcgKmh3KQo+ICB7Cj4gIAlzdHJ1
Y3QgY2xrX3JlZ21hcCAqY2xrID0gdG9fY2xrX3JlZ21hcChodyk7Cj4gQEAgLTM2Niw1MyArMzgz
LDQ4IEBAIHN0YXRpYyBpbnQgbWVzb25fY2xrX3BsbF9lbmFibGUoc3RydWN0IGNsa19odyAqaHcp
Cj4gIAlpZiAoTUVTT05fUEFSTV9BUFBMSUNBQkxFKCZwbGwtPnJzdCkpCj4gIAkJbWVzb25fcGFy
bV93cml0ZShjbGstPm1hcCwgJnBsbC0+cnN0LCAxKTsKPiAgCj4gKwkvKiBEaXNhYmxlIHRoZSBQ
TEwgbG9jay1kZXRlY3QgbW9kdWxlICovCj4gKwlpZiAoTUVTT05fUEFSTV9BUFBMSUNBQkxFKCZw
bGwtPmxfZGV0ZWN0KSkKPiArCQltZXNvbl9wYXJtX3dyaXRlKGNsay0+bWFwLCAmcGxsLT5sX2Rl
dGVjdCwgMSk7Cj4gKwo+ICAJLyogRW5hYmxlIHRoZSBwbGwgKi8KPiAgCW1lc29uX3Bhcm1fd3Jp
dGUoY2xrLT5tYXAsICZwbGwtPmVuLCAxKTsKPiAtCj4gLQkvKiBUYWtlIHRoZSBwbGwgb3V0IHJl
c2V0ICovCj4gLQlpZiAoTUVTT05fUEFSTV9BUFBMSUNBQkxFKCZwbGwtPnJzdCkpCj4gLQkJbWVz
b25fcGFybV93cml0ZShjbGstPm1hcCwgJnBsbC0+cnN0LCAwKTsKPiArCS8qIFdhaXQgZm9yIEJh
bmRnYXAgYW5kIExETyB0byBwb3dlciB1cCBhbmQgc3RhYmlsaXplICovCj4gKwl1ZGVsYXkoMjAp
Owo+ICAKPiAgCS8qCj4gIAkgKiBDb21wYXJlZCB3aXRoIHRoZSBwcmV2aW91cyBTb0NzLCBzZWxm
LWFkYXB0aW9uIGN1cnJlbnQgbW9kdWxlCj4gIAkgKiBpcyBuZXdseSBhZGRlZCBmb3IgQTEsIGtl
ZXAgdGhlIG5ldyBwb3dlci1vbiBzZXF1ZW5jZSB0byBlbmFibGUgdGhlCj4gIAkgKiBQTEwuIFRo
ZSBzZXF1ZW5jZSBpczoKPiAtCSAqIDEuIGVuYWJsZSB0aGUgcGxsLCBkZWxheSBmb3IgMTB1cwo+
ICsJICogMS4gZW5hYmxlIHRoZSBwbGwsIGVuc3VyZSBhIG1pbmltdW0gZGVsYXkgb2YgMTDOvHMK
PiAgCSAqIDIuIGVuYWJsZSB0aGUgcGxsIHNlbGYtYWRhcHRpb24gY3VycmVudCBtb2R1bGUsIGRl
bGF5IGZvciA0MHVzCj4gIAkgKiAzLiBlbmFibGUgdGhlIGxvY2sgZGV0ZWN0IG1vZHVsZQo+ICAJ
ICovCj4gIAlpZiAoTUVTT05fUEFSTV9BUFBMSUNBQkxFKCZwbGwtPmN1cnJlbnRfZW4pKSB7Cj4g
LQkJdWRlbGF5KDEwKTsKPiAgCQltZXNvbl9wYXJtX3dyaXRlKGNsay0+bWFwLCAmcGxsLT5jdXJy
ZW50X2VuLCAxKTsKPiAtCQl1ZGVsYXkoNDApOwo+IC0JfQo+IC0KPiAtCWlmIChNRVNPTl9QQVJN
X0FQUExJQ0FCTEUoJnBsbC0+bF9kZXRlY3QpKSB7Cj4gLQkJbWVzb25fcGFybV93cml0ZShjbGst
Pm1hcCwgJnBsbC0+bF9kZXRlY3QsIDEpOwo+IC0JCW1lc29uX3Bhcm1fd3JpdGUoY2xrLT5tYXAs
ICZwbGwtPmxfZGV0ZWN0LCAwKTsKPiArCQl1ZGVsYXkoMjApOwo+ICAJfQo+ICAKPiAtCWlmICht
ZXNvbl9jbGtfcGxsX3dhaXRfbG9jayhodykpCj4gLQkJcmV0dXJuIC1FSU87Cj4gKwkvKiBUYWtl
IHRoZSBwbGwgb3V0IHJlc2V0ICovCj4gKwlpZiAoTUVTT05fUEFSTV9BUFBMSUNBQkxFKCZwbGwt
PnJzdCkpCj4gKwkJbWVzb25fcGFybV93cml0ZShjbGstPm1hcCwgJnBsbC0+cnN0LCAwKTsKPiAg
Cj4gLQlyZXR1cm4gMDsKPiAtfQo+ICsJLyogV2FpdCBmb3IgUExMIGxvb3Agc3RhYmlsaXphdGlv
biAqLwo+ICsJdWRlbGF5KDIwKTsKPiAgCj4gLXN0YXRpYyB2b2lkIG1lc29uX2Nsa19wbGxfZGlz
YWJsZShzdHJ1Y3QgY2xrX2h3ICpodykKPiAtewo+IC0Jc3RydWN0IGNsa19yZWdtYXAgKmNsayA9
IHRvX2Nsa19yZWdtYXAoaHcpOwo+IC0Jc3RydWN0IG1lc29uX2Nsa19wbGxfZGF0YSAqcGxsID0g
bWVzb25fY2xrX3BsbF9kYXRhKGNsayk7Cj4gKwkvKiBFbmFibGUgdGhlIGxvY2stZGV0ZWN0IG1v
ZHVsZSAqLwo+ICsJaWYgKE1FU09OX1BBUk1fQVBQTElDQUJMRSgmcGxsLT5sX2RldGVjdCkpCj4g
KwkJbWVzb25fcGFybV93cml0ZShjbGstPm1hcCwgJnBsbC0+bF9kZXRlY3QsIDApOwo+ICAKPiAt
CS8qIFB1dCB0aGUgcGxsIGlzIGluIHJlc2V0ICovCj4gLQlpZiAoTUVTT05fUEFSTV9BUFBMSUNB
QkxFKCZwbGwtPnJzdCkpCj4gLQkJbWVzb25fcGFybV93cml0ZShjbGstPm1hcCwgJnBsbC0+cnN0
LCAxKTsKPiArCWlmIChtZXNvbl9jbGtfcGxsX3dhaXRfbG9jayhodykpIHsKPiArCQkvKiBkaXNh
YmxlIFBMTCB3aGVuIFBMTCBsb2NrIGZhaWxlZC4gKi8KPiArCQltZXNvbl9jbGtfcGxsX2Rpc2Fi
bGUoaHcpOwo+ICsJCXByX3dhcm4oIiVzOiBQTEwgbG9jayBmYWlsZWQhISFcbiIsIGNsa19od19n
ZXRfbmFtZShodykpOwo+ICAKPiAtCS8qIERpc2FibGUgdGhlIHBsbCAqLwo+IC0JbWVzb25fcGFy
bV93cml0ZShjbGstPm1hcCwgJnBsbC0+ZW4sIDApOwo+ICsJCXJldHVybiAtRUlPOwo+ICsJfQo+
ICAKPiAtCS8qIERpc2FibGUgUExMIGludGVybmFsIHNlbGYtYWRhcHRpb24gY3VycmVudCBtb2R1
bGUgKi8KPiAtCWlmIChNRVNPTl9QQVJNX0FQUExJQ0FCTEUoJnBsbC0+Y3VycmVudF9lbikpCj4g
LQkJbWVzb25fcGFybV93cml0ZShjbGstPm1hcCwgJnBsbC0+Y3VycmVudF9lbiwgMCk7Cj4gKwly
ZXR1cm4gMDsKPiAgfQo+ICAKPiAgc3RhdGljIGludCBtZXNvbl9jbGtfcGxsX3NldF9yYXRlKHN0
cnVjdCBjbGtfaHcgKmh3LCB1bnNpZ25lZCBsb25nIHJhdGUsCgotLSAKSmVyb21lCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
