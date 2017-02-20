function outFace = faceAffine(inFace, alignPoints, initPoints)
% 140 * 140

tform = fitgeotrans(alignPoints, initPoints, 'nonreflectivesimilarity');
ref = imref2d([140, 140]);
[outFace, ~] = imwarp(inFace, tform, 'OutputView', ref);

end
