Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A63CC6B1A
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Oct 2026 10:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zACriirsFlPp/XrUenV8hSdLZTB0Z74mvfXdRKFYAVI=; b=YM2oUHK2WK4Jkz
	qoi2KfhBKZT6V4tEW4Mf+Q3v/kHsWvX5rGW+VRPIsMuMtpLNLIlRNhxJ3ImMAKvsJELTlVhyuNc8P
	SAo029kIZRqbXdSoe0dhh7exAy0lzmTKumCqgRxgKvMkTi72qLGm7HHH4EavO2a0WF0vqBlgwXAUd
	cnKkDIXvg591AMEiYKl3th4Djjfl0WaiGHyPamgdDt88LiutQLpUd5Bohgok7ND2aZ08PuOipL58W
	cxEWAlDV9Z7GpR65sdh/rHOVRYf+ttzx6sQPz3H3LePdxQF/pb/EFfoGYpw+3IGvw036LA3SuE+HQ
	OnadAskDIiy+OMWW6QzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGw2m-0000000FBkq-2TpA;
	Wed, 14 Oct 2026 10:17:08 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGw2j-0000000FBjj-2DsX
	for linux-amlogic@lists.infradead.org;
	Wed, 14 Oct 2026 10:17:06 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-6798c43a3d6so333901d50.1
        for <linux-amlogic@lists.infradead.org>; Wed, 14 Oct 2026 03:17:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791973024; cv=none;
        d=google.com; s=arc-20260327;
        b=LYA3Avi85xAMxCRu5buEYE8WPEk1PlQb6to+bVnGy2FWR+dUaNj1lc049ftzpbNNOR
         QkQojDu5VASF0Lc1tU3ofkfDwYM1HfapPJLuOtB2nvUP1M8upbRX3c0+Prv4DN0NVM63
         gvSkyLizn99b1zPbOWDf3X1/vkOFwPqDwvE1+EZ69qQd8LU1CpuTej3G35TmgBssO3xE
         r1PXIJK+ihXPzN980M0+EirZRsHf1mz1TWRJZqRXeMvixDvhnzWlCoLXylY4UoHj0Otj
         WfPqiEhhfPG8+w+WueDVb2u3DzKsf8L4ugqZZ6Bct62WAArjgxbYFk2D7e6PkaVP/r+Q
         F+5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zNSNJNbOjn0ZweiURlFy5cYJ2JPfFsmhS88eDUK8lCI=;
        fh=lwN5MKt/4WoLvPuXR4xraIRThePDltUrSTfcCKsp51Q=;
        b=fPHZ9bTrnYPAfAvTv+jNFux6t40AbouVMOA1Fv2RAdC2f4afGiINkxtdSlUSrLyeib
         /jxGZ/yoa5oRtEgV9mNa4xxC+T9V9mz0/mRbYRx2chmpEFWhduEliRXWOUbRL18NIwtx
         /t3snTAcL5JNcwb4RQ2rPbgwBrh+j9OYwtNUtLcFHCMOVBqLRQ3bAq038HFamnLtP63/
         RmYxDDpmRlwhVcgzVAYQP6vFktPlAgcN6KdbqR4c1cSjp/qXpOMIk9cpCfXAFAmjmPRB
         yCi93fTN+lOuaW+FO802JoQdctonOaX/+SXiGH3ijpCcmgssWxAyHlHunGePrpPa2dBl
         UPXQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791973024; x=1792577824; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zNSNJNbOjn0ZweiURlFy5cYJ2JPfFsmhS88eDUK8lCI=;
        b=XYW/OWW9zCi9zweM/OQmskbDEOYAiRIkFR+VtRELzGPjopscnezFwYTWkj2gzuVtD7
         xsVEZsJglykjDZ2GOcvwj0LxyY8gE8lU3rQmRzj7EraMdhUL9OiWu6Jl/vcnyIfNXTkL
         qTFWOxOSg773432yxFPLudRPYzr4YKAeMiOl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791973024; x=1792577824;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zNSNJNbOjn0ZweiURlFy5cYJ2JPfFsmhS88eDUK8lCI=;
        b=jRhmxuAWji8yMb0yL45cR5lwa4QYcBeRpNuvDbpOh62DnbNWQ7nw841JjIfifO/v2C
         Ir//maMnLkjJj5sBBhoICm4DEXSPZPJAWVUy8Jjm0k1lNW108vOdJyBVLCkrn/Jv8DpK
         yUQ2aJ/4CRJmE6ob8boJsg+0t7GSPcYHfFtHoXCnAuKYeTNFweYchMWY4eyGHqDUviqz
         Q5NG5pMhYaN0a6eL7BhpYJsIa3XmFfrpUshE+Law13x81K+y1IoRQno11ijTHgWGVzWm
         1u+oT0WF2pzr13ahw+xh8oR1ce2lBWW6TMTzHOCvzS1coW1OPJgDUYUmz46Wf3tZRcsy
         lFFg==
X-Forwarded-Encrypted: i=1; AKwUvBy/s8vqJ1RDzWb3pn86BD7iMZLaPPFXLXIVy+5tbM2eaYSipgIVjL3gm9WCVS8iD2TCPplgv3rmE69r3aRi@lists.infradead.org
X-Gm-Message-State: AFq9FYLcS+to2gCTgjFdQxTli/wi3bw3wK13AzdhT7PW6pitaBUlVWcc
	DFuR3Mz2fjsRJAhrlqLS1ngyCEo8XwXsnF0WlVp7T1SXpnqV0+MD4J/HIkdCYP7QcTDeM1sNQkC
	9F1OxqXA/Tc2hx+AWsyh4fB/2qC+FIcmQ4Os/WMXe
X-Gm-Gg: AYBFou0dTm2TYpaunG043tQ2ZstPMJXAyiCcbC4LHD2e6X1uGFYWd8jDG1PXSCr7CCN
	2xDnhzv+1u9sWXtZHzpL3P4eFLxEH8JgZzMYFXIdOPhAx/rCbgH/2wMzjOpdwWD1wAtqbfrPmFM
	TcoFK0GRCPB7tMFVe06fhKW7/UOosF2+ped7Eb5QAgBFSn4Rb5vTTYeJoObxro65vYDpvLmvAAo
	BqIhcPRoJj+6qAKJMwrNJmlYHA2we+uguRC09Tp/ORQDFZ+f4VXxiQEZOiJHPmYihXogSee9zUS
	Vrkd46XINVh5bg08KNQL8Io4mnZCoh+M4cDIImZ4N1M92DtbsGWmakow
X-Received: by 2002:a05:690e:b49:b0:679:8dd7:1d19 with SMTP id
 956f58d0204a3-6798dd71ef4mr307524d50.74.1791973024101; Wed, 14 Oct 2026
 03:17:04 -0700 (PDT)
MIME-Version: 1.0
References: <20261014082037.1774672-1-wenst@chromium.org> <20261014082037.1774672-2-wenst@chromium.org>
 <sashiko-outbox-171010@kernel.org>
In-Reply-To: <sashiko-outbox-171010@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 14 Oct 2026 19:16:51 +0900
X-Gm-Features: AclHuK8vB58kVrwUvnG_FV1Bk2KZp5BcyBdkPIRhgzNfIxk2PQPvWDXOfCqkhAM
Message-ID: <CAGXv+5EuYc3iEpwNDNX+Sa2QXnPNe_C0HHH1PCy+j2vyV88xuA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: usb: hcd: Add downstream USB ports
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, imx@lists.linux.dev, robh@kernel.org, 
	conor+dt@kernel.org, Frank.Li@kernel.org, neil.armstrong@linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_031705_577067_68406231 
X-CRM114-Status: GOOD (  14.92  )
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

T24gV2VkLCBPY3QgMTQsIDIwMjYgYXQgNTozMeKAr1BNIDxzYXNoaWtvLWJvdEBrZXJuZWwub3Jn
PiB3cm90ZToKPgo+IFRoYW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkg
cmV2aWV3IGZvdW5kIDEgcG90ZW50aWFsIGlzc3VlKHMpIHRvIGNvbnNpZGVyOgo+IC0gW01lZGl1
bV0gZHQtYmluZGluZ3M6IHVzYjogcG9ydEAwIHNjaGVtYSBjb25zdHJhaW50IGJ5cGFzc2VkCj4g
LS0KPgo+IGNvbW1pdCBhYWE2MTA3NjYzZjRkNTI0YzI2NmMzYTE4MjY0YzQxNmE4NmE0YmI0Cj4g
QXV0aG9yOiBDaGVuLVl1IFRzYWkgPHdlbnN0QGNocm9taXVtLm9yZz4KPgo+IGR0LWJpbmRpbmdz
OiB1c2I6IGhjZDogQWRkIGRvd25zdHJlYW0gVVNCIHBvcnRzCj4KPiBUaGlzIGNvbW1pdCBhZGRz
IGEgInBvcnRzIiBjaGlsZCBub2RlIHRvIHRoZSBVU0IgSENEIGJpbmRpbmcgdG8gc3VwcG9ydAo+
IGNvbm5lY3RpbmcgZG93bnN0cmVhbSBVU0IgY29ubmVjdG9yIG5vZGVzIHZpYSBPRiBncmFwaC4g
SXQgYXR0ZW1wdHMgdG8gZW5mb3JjZQo+IHRoYXQgVVNCIGRvd25zdHJlYW0gcG9ydCBudW1iZXJz
IHN0YXJ0IGF0IDEsIGFuZCB1cGRhdGVzIHRoZSBhZGRyZXNzIG1hdGNoaW5nCj4gZm9yIGhhcmQt
d2lyZWQgZG93bnN0cmVhbSBkZXZpY2VzLgo+Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi91c2ItaGNkLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvdXNiL3VzYi1oY2QueWFtbAo+ID4gaW5kZXggNDVhMTlkNDkyOGFm
YS4uMjRkZjk5ZGZiMjQzYyAxMDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy91c2IvdXNiLWhjZC55YW1sCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvdXNiL3VzYi1oY2QueWFtbAo+ID4gQEAgLTI5LDggKzI5LDE2IEBAIHBy
b3BlcnRpZXM6Cj4gPiAgICAiI3NpemUtY2VsbHMiOgo+ID4gICAgICBjb25zdDogMAo+ID4KPiA+
ICsgIHBvcnRzOgo+ID4gKyAgICAkcmVmOiAvc2NoZW1hcy9ncmFwaC55YW1sIy9wcm9wZXJ0aWVz
L3BvcnRzCj4gPiArICAgIGRlc2NyaXB0aW9uOiBUaGUgZG93bnN0cmVhbSBmYWNpbmcgVVNCIHBv
cnRzCj4gPiArCj4gPiArICAgIHBhdHRlcm5Qcm9wZXJ0aWVzOgo+ID4gKyAgICAgICJecG9ydEBb
MS05YS1mXVswLTlhLWZdPyQiOgo+ID4gKyAgICAgICAgJHJlZjogL3NjaGVtYXMvZ3JhcGgueWFt
bCMvcHJvcGVydGllcy9wb3J0Cj4KPiBbU2V2ZXJpdHk6IE1lZGl1bV0KPiBEb2VzIHRoaXMgbG9j
YWwgY29uc3RyYWludCBhY3R1YWxseSBwcmV2ZW50IHBvcnRAMCBmcm9tIHBhc3NpbmcgdmFsaWRh
dGlvbj8KPgo+IFNpbmNlIEpTT04gc2NoZW1hIHBhdHRlcm5Qcm9wZXJ0aWVzIG9ubHkgcmVzdHJp
Y3QgbWF0Y2hpbmcgbm9kZXMsIGEKPiBub24tbWF0Y2hpbmcgbm9kZSBsaWtlIHBvcnRAMCB3aWxs
IGZhbGwgYmFjayB0byB0aGUgZ2VuZXJpYyBncmFwaC55YW1sCj4gcmVmZXJlbmNlLgo+Cj4gQmVj
YXVzZSBncmFwaC55YW1sIGV2YWx1YXRlcyBhbnl0aGluZyBtYXRjaGluZyBecG9ydChALiopPyQs
IHdvdWxkbid0Cj4gcG9ydEAwIGJlIGV2YWx1YXRlZCBhcyB2YWxpZCBhbmQgc2lsZW50bHkgcGFz
cywgY29tcGxldGVseSBieXBhc3NpbmcgdGhlCj4gaW50ZW50IHRoYXQgZG93bnN0cmVhbSBwb3J0
IG51bWJlcnMgc3RhcnQgYXQgMT8KCkkgc3VzcGVjdCBJIG5lZWQgdG8gd3JpdGUgaXQgYXM6Cgog
ICAgcG9ydHM6CiAgICAgIHByb3BlcnRpZXM6CiAgICAgICAgcG9ydEAwOiBmYWxzZQogICAgICBw
YXR0ZXJuUHJvcGVydGllczoKICAgICAgICAiXnBvcnRAWzEtOWEtZl1bMC05YS1mXT8kIjogLi4u
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
