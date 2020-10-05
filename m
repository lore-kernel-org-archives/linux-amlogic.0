Return-Path: <SRS0=hoO3=DM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9DADC4363A
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Oct 2020 12:52:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFA7F20756
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Oct 2020 12:52:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T/BjWfpQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Itjy3zN4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFA7F20756
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3znEd8covMMNonyT5kZlG39o326DNYzuRePN07hIezo=; b=T/BjWfpQfF9iyh39qHgJaSfWA3
	hGMua2YgbFvRQLytThuy7lK8Vjp2z+XiUPRXTtOAaJH+GkMAFqnFvyvIIqcwYjOcn1cMpOD41eyw+
	oUGQ2649iYFSGgfjKbBDHRRibeCrTGmma1JVY31EcjpPJI9fnaL8YZvQczpVtgcoB6q2HhPhneMzP
	ubmAf3Z46r4H+GTTHZNhM7uIz6sFxlu5triqEAMmDsyVNBbMNEIFhWuRL9PYC+ESKOIyzdQVURqaG
	6OFuCa4OB1hByGXI07coG2v7JPinnvcQSF4dP8etH6hYBxYGkQ54eYr1Lpk/T7N1riwbjLbTfQM7m
	Lex4qT1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPPyx-00058S-85; Mon, 05 Oct 2020 12:52:47 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPPyt-00057K-Jy
 for linux-amlogic@lists.infradead.org; Mon, 05 Oct 2020 12:52:45 +0000
Received: by mail-wr1-x443.google.com with SMTP id h7so5808385wre.4
 for <linux-amlogic@lists.infradead.org>; Mon, 05 Oct 2020 05:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:autocrypt:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cvbrUQ3KPOO7WSNEQPVjEl59MtuNDdo0MMs1k/VMPZE=;
 b=Itjy3zN4Emb+BZoTUvugNoPE2dxp7B7Zs4SRAmH+vMwuGixsv9obhybl9ztOCTLAsH
 KxzcspHl/GEzm7CoPHvjpFxRty0XMZX2uiDV719ErMrSjsRwbj7Hi/IstoGE/un26xhh
 tfe1QZtPq0UHtOz5415OLJ4ogJlCChmCrsjPtxwA/jcAafOXZ6g+S8P4sV3zcfo7j0gw
 VrzosUQN42WVhYpwqPFmTqjbB8STZ+SM5iUAZ9fgD34HBMWV5yrW+eQvy8TJLZWo6V8b
 ewI4ln0/H7bM+tMFUoJv2934a04BmJJKgsPB6De7GGzbOtwQWkRvCWZgtoYnDRKglkTW
 BPzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=cvbrUQ3KPOO7WSNEQPVjEl59MtuNDdo0MMs1k/VMPZE=;
 b=DGHp17gt6hobrbDolFK5uB6LVHnANcCa+zUqkNfWVkq3foBV3weLr5bH1rynSA2py2
 uGf+gTwvEEKs9DCVc4afsY+awDpDCaXymk+uY0DFxLLpKD3F7SkR0WorQllpJjbFvGWE
 kzH+fAftLLAApRwLzu4A+l7NRlvcYl0xUEW4Jvu9sj4w1BIKQEKhvQVY32PeCkiEHZNg
 PYdFVzSyXoD+T3RRB6FmLYH778w6+3Z7gCQiLw/p45SFnBl21qcn+1RNdskLokVRHeCo
 E2PWG7FJHlaCjggQUkTt6kK3DodvA42Qe1AK9bQzsT0f6DMun+pz8EkVhmwGhSolaTVg
 c7VQ==
X-Gm-Message-State: AOAM5331BBTkwitUdb2w/VYWJAA8LY2CTtUEN5wVVc8lobprlnbFhTCg
 TKZWHFWSsVABOsLllyCCwIFFN9l5DMtkcRNe
X-Google-Smtp-Source: ABdhPJyPd9G/RwrEg6TxVCrKyo9vs5a+BrP4NdV7RA0zvEC4SmJwm/wg2w6sGMZ4sGU0dl1nlSR4EQ==
X-Received: by 2002:adf:eb86:: with SMTP id t6mr11455738wrn.411.1601902360162; 
 Mon, 05 Oct 2020 05:52:40 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:e438:6e4a:55da:c1f3?
 ([2a01:e35:2ec0:82b0:e438:6e4a:55da:c1f3])
 by smtp.gmail.com with ESMTPSA id d18sm12811579wrm.10.2020.10.05.05.52.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Oct 2020 05:52:39 -0700 (PDT)
Subject: Re: S905x (VIM) ramdon crashes, maybe due to display driver.
To: "zhangn1985@outlook.com" <zhangn1985@outlook.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>
References: <SYCPR01MB37764A52D0614522A279AC76CD0C0@SYCPR01MB3776.ausprd01.prod.outlook.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 mQENBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAG0KE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT6JATsEEwEKACUC
 GyMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheABQJXDO2CAhkBAAoJEBaat7Gkz/iubGIH/iyk
 RqvgB62oKOFlgOTYCMkYpm2aAOZZLf6VKHKc7DoVwuUkjHfIRXdslbrxi4pk5VKU6ZP9AKsN
 NtMZntB8WrBTtkAZfZbTF7850uwd3eU5cN/7N1Q6g0JQihE7w4GlIkEpQ8vwSg5W7hkx3yQ6
 2YzrUZh/b7QThXbNZ7xOeSEms014QXazx8+txR7jrGF3dYxBsCkotO/8DNtZ1R+aUvRfpKg5
 ZgABTC0LmAQnuUUf2PHcKFAHZo5KrdO+tyfL+LgTUXIXkK+tenkLsAJ0cagz1EZ5gntuheLD
 YJuzS4zN+1Asmb9kVKxhjSQOcIh6g2tw7vaYJgL/OzJtZi6JlIW5AQ0ETVkGzwEIALyKDN/O
 GURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYpQTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXM
 coJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hi
 SvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY4yG6xI99NIPEVE9lNBXBKIlewIyVlkOa
 YvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoMMtsyw18YoX9BqMFInxqYQQ3j/HpVgTSv
 mo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUXoUk33HEAEQEAAYkBHwQYAQIACQUCTVkG
 zwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfnM7IbRuiSZS1unlySUVYu3SD6YBYnNi3G
 5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa33eDIHu/zr1HMKErm+2SD6PO9umRef8V8
 2o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCSKmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+
 RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJ
 C3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTTQbM0WUIBIcGmq38+OgUsMYu4NzLu7uZF
 Acmp6h8guQINBFYnf6QBEADQ+wBYa+X2n/xIQz/RUoGHf84Jm+yTqRT43t7sO48/cBW9vAn9
 GNwnJ3HRJWKATW0ZXrCr40ES/JqM1fUTfiFDB3VMdWpEfwOAT1zXS+0rX8yljgsWR1UvqyEP
 3xN0M/40Zk+rdmZKaZS8VQaXbveaiWMEmY7sBV3QvgOzB7UF2It1HwoCon5Y+PvyE3CguhBd
 9iq5iEampkMIkbA3FFCpQFI5Ai3BywkLzbA3ZtnMXR8Qt9gFZtyXvFQrB+/6hDzEPnBGZOOx
 zkd/iIX59SxBuS38LMlhPPycbFNmtauOC0DNpXCv9ACgC9tFw3exER/xQgSpDVc4vrL2Cacr
 wmQp1k9E0W+9pk/l8S1jcHx03hgCxPtQLOIyEu9iIJb27TjcXNjiInd7Uea195NldIrndD+x
 58/yU3X70qVY+eWbqzpdlwF1KRm6uV0ZOQhEhbi0FfKKgsYFgBIBchGqSOBsCbL35f9hK/JC
 6LnGDtSHeJs+jd9/qJj4WqF3x8i0sncQ/gszSajdhnWrxraG3b7/9ldMLpKo/OoihfLaCxtv
 xYmtw8TGhlMaiOxjDrohmY1z7f3rf6njskoIXUO0nabun1nPAiV1dpjleg60s3OmVQeEpr3a
 K7gR1ljkemJzM9NUoRROPaT7nMlNYQL+IwuthJd6XQqwzp1jRTGG26J97wARAQABiQM+BBgB
 AgAJBQJWJ3+kAhsCAikJEBaat7Gkz/iuwV0gBBkBAgAGBQJWJ3+kAAoJEHfc29rIyEnRk6MQ
 AJDo0nxsadLpYB26FALZsWlN74rnFXth5dQVQ7SkipmyFWZhFL8fQ9OiIoxWhM6rSg9+C1w+
 n45eByMg2b8H3mmQmyWztdI95OxSREKwbaXVapCcZnv52JRjlc3DoiiHqTZML5x1Z7lQ1T3F
 8o9sKrbFO1WQw1+Nc91+MU0MGN0jtfZ0Tvn/ouEZrSXCE4K3oDGtj3AdC764yZVq6CPigCgs
 6Ex80k6QlzCdVP3RKsnPO2xQXXPgyJPJlpD8bHHHW7OLfoR9DaBNympfcbQJeekQrTvyoASw
 EOTPKE6CVWrcQIztUp0WFTdRGgMK0cZB3Xfe6sOp24PQTHAKGtjTHNP/THomkH24Fum9K3iM
 /4Wh4V2eqGEgpdeSp5K+LdaNyNgaqzMOtt4HYk86LYLSHfFXywdlbGrY9+TqiJ+ZVW4trmui
 NIJCOku8SYansq34QzYM0x3UFRwff+45zNBEVzctSnremg1mVgrzOfXU8rt+4N1b2MxorPF8
 619aCwVP7U16qNSBaqiAJr4e5SNEnoAq18+1Gp8QsFG0ARY8xp+qaKBByWES7lRi3QbqAKZf
 yOHS6gmYo9gBmuAhc65/VtHMJtxwjpUeN4Bcs9HUpDMDVHdfeRa73wM+wY5potfQ5zkSp0Jp
 bxnv/cRBH6+c43stTffprd//4Hgz+nJcCgZKtCYIAPkUxABC85ID2CidzbraErVACmRoizhT
 KR2OiqSLW2x4xdmSiFNcIWkWJB6Qdri0Fzs2dHe8etD1HYaht1ZhZ810s7QOL7JwypO8dscN
 KTEkyoTGn6cWj0CX+PeP4xp8AR8ot4d0BhtUY34UPzjE1/xyrQFAdnLd0PP4wXxdIUuRs0+n
 WLY9Aou/vC1LAdlaGsoTVzJ2gX4fkKQIWhX0WVk41BSFeDKQ3RQ2pnuzwedLO94Bf6X0G48O
 VsbXrP9BZ6snXyHfebPnno/te5XRqZTL9aJOytB/1iUna+1MAwBxGFPvqeEUUyT+gx1l3Acl
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <79305527-ca16-598f-2963-4b87c106892b@baylibre.com>
Date: Mon, 5 Oct 2020 14:52:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <SYCPR01MB37764A52D0614522A279AC76CD0C0@SYCPR01MB3776.ausprd01.prod.outlook.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_085243_679989_3B0E04F0 
X-CRM114-Status: GOOD (  16.80  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
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

SGksCgpPbiAwNS8xMC8yMDIwIDE0OjQyLCB6aGFuZ24xOTg1QG91dGxvb2suY29tIHdyb3RlOgo+
IGhpLAo+IAo+IEkgb2JzZXJ2ZWQgVklNIHJhbWRvbiBjcmFzaGVzIGZyb20gNS43IGtlcm5lbCB3
aXRoIFdJUCBwYXRjaGVzWzFdIGZyb20gdGhpcyBtYWlsIGxpc3QuIAo+IAo+IEkgaGF2ZSB0cmll
ZCB0byBmaW5kIGJldHRlciBwb3dlciBzdXBwbHkswqAgcmVtb3ZlIGNhc2UsIMKgIGluc3RhbGwg
Y29vbGluZyBmdW4sIGRpc2FibGUgWHNlcnZlci4gVklNIHN0aWxsIHJhbWRvbiBjcmFzaGVzLgo+
IAo+IFRodXMgSSB0aGluayB0aGlzIG1heWJlIFZJTSBpcyBicm9rZW4sIG1heWJlIGR1ZSB0byB0
aGVybWFsLgo+IAo+IEkgZG9uJ3QgaGF2ZSBhIGNoYW5jZSB0byBnZXQgdGhlIGxvZywgZXZlbiBu
byBsb2cgcHJpbnQgdG8gY29uc29sZSwgd2hlbiBjcmFzaCBoYXBwZW5zLgo+IAo+IHRoZXNlIGRh
eXMsIEkgbWFkZSBpdCBhbiBhcm02NCBidWlsZCBzZXJ2ZXIsIHdpdGhvdXQgY29ubmVjdCBhIEhE
TUkgZGlzcGxheS4gaXQgcnVucyB2ZXJ5IHdlbGwsIGJ1aWxkIGtlcm5lbCAzIGRheXMgd2l0aG91
dCBhbnkgY3Jhc2guCj4gCj4gZnJvbSB0aGXCoHBoZW5vbWVub24gSSB0aGluayBzb21lIGhpZGRl
biBpc3N1ZXMgbWF5IGluIGRpc3BsYXkgZHJpdmVyLgoKWW91ciByZXBvcnQgaXMgZXh0cmVtZWx5
IHZhZ3VlLCBjb3VsZCB5b3UgYmUgbW9yZSBwcmVjaXNlIGFib3V0IHdoaWNoIHBhdGNoIGNhdXNl
cyB0aGUgaXNzdWUgPwpEb2VzIGl0IHN0aWxsIG9jY3VyIG9uIG1vcmUgcmVjZW50IHN0YWJsZSBr
ZXJuZWxzID8KUGxlYXNlIGNhdGNoIHRoZSBjcmFzaCBvbiB0aGUgY29uc29sZSwgb3RoZXJ3aXNl
IHdlIGNvdWxkbid0IGhlbHAuLi4KCk5laWwKCj4gCj4gCj4gWzFdOiBodHRwczovL2dpdGh1Yi5j
b20vemhhbmduMTk4NS9saW51eC9jb21taXRzL21hc3Rlci9kZWJpYW4vcGF0Y2hlcy9raGFkYXMK
PiAKPiBCUi4KPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IGxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cj4gbGludXgtYW1sb2dpY0BsaXN0cy5p
bmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hbWxvZ2ljCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYW1sb2dpYwo=
